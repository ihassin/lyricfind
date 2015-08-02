require 'open-uri'
require 'nokogiri'

module LyricFind
  class SongInfo
    attr_accessor :lyrics, :artist, :song_name, :album, :duration, :snippet, :instrumental

  end
end
