require 'open-uri'
require 'nokogiri'

module LyricFind
  class API
    def get_snippet_by_song_name artist, song_name
      doc = get_search_api_response artist, song_name
      return nil if doc.nil?

      get_snippet doc

    end
  end
end
