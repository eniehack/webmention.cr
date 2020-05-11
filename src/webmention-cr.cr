# TODO: Write documentation for `Webmention::Cr`
require "http/client"
require "uri"
require "xml"

module WebMention
  VERSION = "0.1.0"
  class WebMention::Discover
    def initialize(@resp : HTTP::Client::Response, @target_url : URI)
      @webmention_endpoint = Set(String).new
      @endpoint_candidates = Set(URI).new
    end

    def discover : String
      if @resp.headers.includes_word?("link", "rel=webmention") || @resp.headers.includes_word?("link", %(rel="webmention"))
        strip_header @resp.headers["link"]
      end
      strip_html @resp.body
      make_endpoint
      return @webmention_endpoint.to_a[0]
    end

    private def strip_header(str : String)
      str.gsub(/^<(.+)>; rel=("(.+)"|(.+))$/) do
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
        @webmention_endpoint.add element.to_s
      end
    end

    private def strip_html(html : String)
      XML.parse(html).xpath_nodes("//link[contains(@rel, 'webmention')]|//a[contains(@rel, 'webmention')]").each do |element|
        element.attributes["rel"].content.split(" ").each do |e|
          next unless e == "webmention"
          @endpoint_candidates.add URI.parse element.attributes["href"].content
        end
      end
    end
  end
end
