require "./spec_helper"
require "http/client"

describe WebMention::Discover do
  it "Webmention.rocks - Discovery Test #1" do
    url = URI.parse "https://webmention.rocks/test/1"
    resp = HTTP::Client.get(url)
    dscv = WebMention::Discover.new(resp, url)
    dscv.discover.should eq("https://webmention.rocks/test/1/webmention")
  end

 it "Webmention.rocks - Discovery Test #2" do
    url = URI.parse "https://webmention.rocks/test/2"
    resp = HTTP::Client.get(url)
    dscv = WebMention::Discover.new(resp, url)
    dscv.discover.should eq("https://webmention.rocks/test/2/webmention")
  end


 it "Webmention.rocks - Discovery Test #3" do
    url = URI.parse "https://webmention.rocks/test/3"
    resp = HTTP::Client.get(url)
    dscv = WebMention::Discover.new(resp, url)
    dscv.discover.should eq("https://webmention.rocks/test/3/webmention")
  end

  it "Webmention.rocks - Discovery Test #4" do
    url = URI.parse "https://webmention.rocks/test/4"
    resp = HTTP::Client.get(url)
    dscv = WebMention::Discover.new(resp, url)
    dscv.discover.should eq("https://webmention.rocks/test/4/webmention")
  end
end
