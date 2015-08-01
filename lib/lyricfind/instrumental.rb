require 'open-uri'
require 'nokogiri'

module LyricFind
  class API
    def instrumental? artist, song_name
      return nil if artist.nil? or artist.length == 0
      return nil if song_name.nil? or song_name.length == 0

      artist = URI.escape artist
      song_name = URI.escape song_name

      begin
        doc = get_api_response artist, song_name
        return if doc.nil?

        return doc.xpath('//tracks/track')[0]['instrumental'] == 'true'
      rescue
        true
      end
    end

  end
end
