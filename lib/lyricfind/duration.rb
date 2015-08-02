require 'open-uri'
require 'nokogiri'

module LyricFind
  class API
    def duration artist, song_name
      doc = get_search_api_response artist, song_name
      return nil if doc.nil?

      get_duration doc

    end
  end
end
