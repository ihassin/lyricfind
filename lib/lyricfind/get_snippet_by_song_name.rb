require 'open-uri'
require 'nokogiri'

module LyricFind
  class API
    def get_snippet_by_song_name artist, song_name
      doc = get_search_api_response artist, song_name
      return nil if doc.nil?

      return doc.xpath('//snippet')[0].content.gsub("\r\n",'').strip

    end
  end
end
