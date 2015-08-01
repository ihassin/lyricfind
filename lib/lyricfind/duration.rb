require 'open-uri'
require 'nokogiri'

module LyricFind
  class API
    def duration artist, song_name
      doc = get_search_api_response artist, song_name
      return nil if doc.nil?

      return doc.xpath('//tracks/track')[0]['duration']

    end
  end
end
