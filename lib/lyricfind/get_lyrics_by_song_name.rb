require 'open-uri'
require 'nokogiri'

module LyricFind
  class API
    def initialize search_api_key, display_api_key
      @search_key = search_api_key
      @display_key = display_api_key
    end

    def get_lyrics_by_song_name artist, song_name
      query_url = URI.escape "http://api.lyricfind.com/search.do?apikey=#{@search_key}&reqtype=default&searchtype=track&artist=#{artist}&track=#{song_name}"
      response = open(query_url).read
      doc = Nokogiri::HTML(response)
      doc.encoding = 'utf-8'

      return nil if !(check_success doc, 100)
      tracks = doc.xpath('//tracks')[0]['totalresults'].to_i
      return nil if tracks == 0

      track = doc.xpath('//tracks/track')[0]['amg']

      query_url = URI.escape "http://api.lyricfind.com/lyric.do?apikey=#{@display_key}&reqtype=default&trackid=amg:#{track}"

      response = open(query_url).read
      doc = Nokogiri::HTML(response)
      doc.encoding = 'utf-8'

      return nil if !(check_success doc, 101)

      lyrics = doc.xpath('//lyrics')
      lyrics[0].content
    end

    def check_success doc, code
      response = doc.xpath('//response')
      response[0]['code'].to_i == code
    end

  end
end
