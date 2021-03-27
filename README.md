# webmention-cr

[WebMention](https://www.w3.org/TR/webmention) library for Crystal lang.

## Installation

1. Add the dependency to your `shard.yml`:

   ```yaml
   dependencies:
     webmention:
       gitlab: eniehack/webmention.cr
   ```

2. Run `shards install`

## Usage

```crystal
require "webmention"
require "http/client"
require "uri"

url = URI.parse "https://www.example.com"
response = HTTP::Client.get url
webmention = Webmention::Discover.new response, url
endpoint = webmention.discover
```

## Development

TODO: Write development instructions here

## Contributing

1. Fork it (<https://gitlab.com/eniehack/webmention-cr/-/forks/new>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [eniehack](https://gitlab.com/eniehack) - creator and maintainer
