require "VCR"
require "lyricfind/version"
require "lyricfind/get_lyrics_by_song_name"

module LyricFind
  VCR.configure do |config|
    config.cassette_library_dir = "spec/vcr_cassettes"
    config.hook_into :webmock # or :fakeweb
  end
end
