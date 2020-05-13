# TODO: Write documentation for `Webmention::Cr`
require "http/client"
require "uri"
require "xml"

module WebMention
  VERSION = "0.1.0"
  class WebMention::Discover
    def initialize(@resp : HTTP::Client::Response, @target_url : URI)
      @webmention_endpoint = Set(URI).new
      @endpoint_candidates = Set(URI).new
    end

    def discover : URI
      if @resp.headers.includes_word?("link", "webmention") || @resp.headers.includes_word?("link", %(rel="webmention"))
        @resp.headers["link"].split(",").each do |element|
          strip_header element
        end
      end
      strip_html @resp.body
      make_endpoint
      return @webmention_endpoint.to_a[0]
    end

    private def strip_header(str : String)
      str.gsub(/<(.+)>; rel=("(.+)"|(.+))/) do
        $2.gsub(/\"/, "").split(" ").each do |e|
          next unless e == "webmention"
          @endpoint_candidates.add URI.parse $1
        end
      end
    end

    private def make_endpoint
      @endpoint_candidates.each do |element|
        unless element.absolute?
          element.scheme = @target_url.scheme
          element.host = @target_url.host
        end

        if element.path.empty?
          element.path = @target_url.path
        elsif element.path[0, 1] != "/"
          array_path = @target_url.path.split("/")
          array_path.pop
          element.path = String.build do |str|
            array_path.each do |e|
              next if e.empty?
              str << "/#{e}"
            end
            str << "/#{element.path}"
          end
        end
        @webmention_endpoint.add element
      end
    end

    private def strip_html(html : String)
      XML.parse(html).xpath_nodes("//link[contains(@rel, 'webmention')]|//a[contains(@rel, 'webmention')]").each do |element|
        element.attributes["rel"].content.split(" ").each do |e|
          next unless e == "webmention"
          next if element.attributes["href"]?.nil?
            @endpoint_candidates.add URI.parse element.attributes["href"].content
        end
      end
    end
  end
end
