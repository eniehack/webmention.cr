require "./spec_helper"
require "http/client"

USERAGENT = HTTP::Headers.new.add("User-Agent", "WebMention.cr test client (https://gitlab.com/eniehack/webmention-cr)")

describe WebMention::Discover do
  it "Webmention.rocks - Discovery Test #1" do
    url = URI.parse "https://webmention.rocks/test/1"
    resp = HTTP::Client.get(url, USERAGENT)
    dscv = WebMention::Discover.new(resp, url)
    dscv.discover.should eq("https://webmention.rocks/test/1/webmention")
  end

  it "Webmention.rocks - Discovery Test #2" do
    url = URI.parse "https://webmention.rocks/test/2"
    resp = HTTP::Client.get(url, USERAGENT)
    dscv = WebMention::Discover.new(resp, url)
    dscv.discover.should eq("https://webmention.rocks/test/2/webmention")
  end

  it "Webmention.rocks - Discovery Test #3" do
    url = URI.parse "https://webmention.rocks/test/3"
    resp = HTTP::Client.get(url, USERAGENT)
    dscv = WebMention::Discover.new(resp, url)
    dscv.discover.should eq("https://webmention.rocks/test/3/webmention")
  end

  it "Webmention.rocks - Discovery Test #4" do
    url = URI.parse "https://webmention.rocks/test/4"
    resp = HTTP::Client.get(url, USERAGENT)
    dscv = WebMention::Discover.new(resp, url)
    dscv.discover.should eq("https://webmention.rocks/test/4/webmention")
  end

  it "Webmention.rocks - Discovery Test #5" do
    url = URI.parse "https://webmention.rocks/test/5"
    resp = HTTP::Client.get(url, USERAGENT)
    dscv = WebMention::Discover.new(resp, url)
    dscv.discover.should eq("https://webmention.rocks/test/5/webmention")
  end

  it "Webmention.rocks - Discovery Test #6" do
    url = URI.parse "https://webmention.rocks/test/6"
    resp = HTTP::Client.get(url, USERAGENT)
    dscv = WebMention::Discover.new(resp, url)
    dscv.discover.should eq("https://webmention.rocks/test/6/webmention")
  end

  it "Webmention.rocks - Discovery Test #7" do
    url = URI.parse "https://webmention.rocks/test/7"
    resp = HTTP::Client.get(url, USERAGENT)
    dscv = WebMention::Discover.new(resp, url)
    dscv.discover.should eq("https://webmention.rocks/test/7/webmention")
  end

  it "Webmention.rocks - Discovery Test #8" do
    url = URI.parse "https://webmention.rocks/test/8"
    resp = HTTP::Client.get(url, USERAGENT)
    dscv = WebMention::Discover.new(resp, url)
    dscv.discover.should eq("https://webmention.rocks/test/8/webmention")
  end

  it "Webmention.rocks - Discovery Test #9" do
    url = URI.parse "https://webmention.rocks/test/9"
    resp = HTTP::Client.get(url, USERAGENT)
    dscv = WebMention::Discover.new(resp, url)
    dscv.discover.should eq("https://webmention.rocks/test/9/webmention")
  end

  it "Webmention.rocks - Discovery Test #10" do
    url = URI.parse "https://webmention.rocks/test/10"
    resp = HTTP::Client.get(url, USERAGENT)
    dscv = WebMention::Discover.new(resp, url)
    dscv.discover.should eq("https://webmention.rocks/test/10/webmention")
  end

  it "Webmention.rocks - Discovery Test #11" do
    url = URI.parse "https://webmention.rocks/test/11"
    resp = HTTP::Client.get(url, USERAGENT)
    dscv = WebMention::Discover.new(resp, url)
    dscv.discover.should eq("https://webmention.rocks/test/11/webmention")
  end

  it "Webmention.rocks - Discovery Test #12" do
    url = URI.parse "https://webmention.rocks/test/12"
    resp = HTTP::Client.get(url, USERAGENT)
    dscv = WebMention::Discover.new(resp, url)
    dscv.discover.should eq("https://webmention.rocks/test/12/webmention")
  end

  it "Webmention.rocks - Discovery Test #13" do
    url = URI.parse "https://webmention.rocks/test/13"
    resp = HTTP::Client.get(url, USERAGENT)
    dscv = WebMention::Discover.new(resp, url)
    dscv.discover.should eq("https://webmention.rocks/test/13/webmention")
  end
end
