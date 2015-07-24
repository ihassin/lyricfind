$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'bundler/setup'
require 'lyricfind'
require 'VCR'

module LyricFind
  VCR.configure do |config|
    config.cassette_library_dir = "spec/vcr_cassettes"
    config.hook_into :webmock # or :fakeweb
  end
end
