require "./spec_helper"
require "http/client"

USERAGENT = HTTP::Headers.new.add("User-Agent", "WebMention.cr test client (https://gitlab.com/eniehack/webmention-cr)")
WEBMENTIONROCKS = "https://webmention.rocks"

macro discover_test(first, last)
  {% for i in (first..last) %}
    it "Webmention.rocks - Discovery Test No.{{i}}" do
      url = URI.parse "#{WEBMENTIONROCKS}/test/{{i}}"
      resp = HTTP::Client.get(url, USERAGENT)
      dscv = WebMention::Discover.new(resp, url)
      dscv.discover.should eq(URI.parse "#{WEBMENTIONROCKS}/test/{{i}}/webmention")
    end
  {% end %}
end

describe WebMention::Discover do
  discover_test 1, 14

  it "Webmention.rocks - Discovery Test #15" do
    url = URI.parse "https://webmention.rocks/test/15"
    resp = HTTP::Client.get(url, USERAGENT)
    dscv = WebMention::Discover.new(resp, url)
    dscv.discover.should eq("https://webmention.rocks/test/15")
  end
end
