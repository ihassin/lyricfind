require_relative 'song_info'

module LyricFind
  class API
    def get_song_info artist, song_name
      song_info = SongInfo.new

      doc = get_search_api_response artist, song_name
      return if doc == nil

      song_info.artist = artist
      song_info.song_name = song_name
      song_info.album =       doc.xpath('//album')[0].content.gsub("\r\n", '').strip
      song_info.duration = doc.xpath('//tracks/track')[0]['duration']
      song_info.snippet = doc.xpath('//snippet')[0].content.gsub("\r\n",'').strip
      song_info.instrumental = doc.xpath('//tracks/track')[0]['instrumental'] == 'true'

      begin
        track = doc.xpath('//tracks/track')[0]['amg']

        query_url = URI.escape "http://api.lyricfind.com/lyric.do?apikey=#{@display_key}&reqtype=default&trackid=amg:#{track}"

        response = open(query_url).read
        doc = Nokogiri::HTML(response)
        doc.encoding = 'utf-8'

        return nil if !(check_success doc, 101)

        lyrics = doc.xpath('//lyrics')
        song_info.lyrics = lyrics[0].content
      rescue Exception => ex
        nil
      end
      song_info

    end

  end
end
