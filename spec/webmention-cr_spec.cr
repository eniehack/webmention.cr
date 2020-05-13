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

macro discover_test_with_endpoint(no, endpoint)
  it "Webmention.rocks - Discovery Test No.{{no}}" do
    url = URI.parse "#{WEBMENTIONROCKS}/test/{{no}}"
    resp = HTTP::Client.get(url, USERAGENT)
    dscv = WebMention::Discover.new(resp, url)
    dscv.discover.should eq(URI.parse {{endpoint}})
  end
end

describe WebMention::Discover do
  discover_test 1, 14
  discover_test_with_endpoint 15, "#{WEBMENTIONROCKS}/test/15"
  discover_test 16, 20
  discover_test_with_endpoint 21, "#{WEBMENTIONROCKS}/test/21/webmention?query=yes"
  discover_test 22, 22
end
