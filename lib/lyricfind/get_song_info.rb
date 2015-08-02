require_relative 'song_info'

module LyricFind
  class API
    def get_song_info artist, song_name
      song_info = SongInfo.new

      doc = get_search_api_response artist, song_name
      return if doc == nil

      song_info.artist        = artist
      song_info.song_name     = song_name
      song_info.album         = get_album doc
      song_info.duration      = get_duration doc
      song_info.snippet       = get_snippet doc
      song_info.instrumental  = get_instrumental doc

      song_info.lyrics = get_lyrics get_track_amg doc

      song_info
    end

    def get_album doc
      doc.xpath('//album')[0].content.gsub("\r\n", '').strip
    end

    def get_duration doc
      doc.xpath('//tracks/track')[0]['duration']
    end

    def get_snippet doc
      doc.xpath('//snippet')[0].content.gsub("\r\n",'').strip
    end

    def get_instrumental doc
      doc.xpath('//tracks/track')[0]['instrumental'] == 'true'
    end

    def get_track_amg doc
      doc.xpath('//tracks/track')[0]['amg']
    end

    def get_lyrics track
      begin
        query_url = URI.escape "http://api.lyricfind.com/lyric.do?apikey=#{@display_key}&reqtype=default&trackid=amg:#{track}"

        response = open(query_url).read
        doc = Nokogiri::HTML(response)
        doc.encoding = 'utf-8'

        return nil if !(check_success doc, 101)

        lyrics = doc.xpath('//lyrics')
        lyrics[0].content
      rescue Exception => ex
        nil
      end

    end
  end
end
