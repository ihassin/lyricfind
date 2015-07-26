# LyricFind

[![Gem Version](https://badge.fury.io/rb/LyricFind.svg)](http://badge.fury.io/rb/LyricFind) | [![Code Climate](https://codeclimate.com/github/ihassin/lyricfind/badges/gpa.svg)](https://codeclimate.com/github/ihassin/lyricfind) | [![License](http://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)](http://opensource.org/licenses/MIT) | [![Issues](http://img.shields.io/github/issues/ihassin/lyricfind.svg?style=flat-square)](http://github.com/ihassin/lyricfind/issues) | [![Releases](http://img.shields.io/github/release/ihassin/lyricfind.svg?style=flat-square)](http://github.com/ihassin/lyricfind/releases) | [![Dependencies](http://img.shields.io/gemnasium/ihassin/lyricfind.svg?style=flat-square)](https://gemnasium.com/ihassin/lyricfind)

This gem allows your application to access LyricFind's API services 

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'LyricFind'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install LyricFind

## Running tests

Create a file called **lyricfind.yml** (see the [example](https://github.com/ihassin/lyricfind/blob/master/spec/lyricfind.yml.example)) and put in your keys there.

The run the tests using

```ruby
rake
```

## Usage

For usage examples from tests, please see [here](https://github.com/ihassin/lyricfind/blob/master/spec/lyricfind_spec.rb)

Simple example:
```ruby
require 'LyricFind'

lf = LyricFind::API.new 'search-key', 'display-key'
puts lf.get_lyrics_by_song_name 'u2', 'one'
```

## Contributing

1. Fork it (https://github.com/ihassin/lyricfind/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## License

[MIT](https://github.com/ihassin/lyricfind/blob/master/LICENSE.txt).

## Other efforts

Look [here](https://github.com/pilu/lyricfind) if you're looking for a Python impementation
