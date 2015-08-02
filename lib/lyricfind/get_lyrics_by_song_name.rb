require 'open-uri'
require 'nokogiri'

module LyricFind
  class API
    def initialize search_api_key, display_api_key
      @search_key = search_api_key
      @display_key = display_api_key
    end

    def get_lyrics_by_song_name artist, song_name
      doc = get_search_api_response artist, song_name
      return if doc == nil

      get_lyrics get_track_amg doc
    end

    def get_search_api_response artist, song_name
      return nil if artist.nil? or artist.length == 0
      return nil if song_name.nil? or song_name.length == 0

      artist = URI.escape artist
      song_name = URI.escape song_name

      begin
        query_url = URI.escape "http://api.lyricfind.com/search.do?apikey=#{@search_key}&reqtype=default&searchtype=track&artist=#{artist}&track=#{song_name}"
        response = open(query_url).read
        doc = Nokogiri::HTML(response)
        doc.encoding = 'utf-8'

        return nil if !(check_success doc, 100)
        tracks = doc.xpath('//tracks')[0]['totalresults'].to_i
        return nil if tracks == 0
        doc
      rescue Exception => ex
        nil
      end
    end

    def check_success doc, code
      begin
        response = doc.xpath('//response')
        response[0]['code'].to_i == code
      rescue
        false
      end
    end

  end
end
