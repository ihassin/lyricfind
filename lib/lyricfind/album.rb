require 'open-uri'
require 'nokogiri'

module LyricFind
  class API
    def album artist, song_name
      doc = get_search_api_response artist, song_name
      return nil if doc.nil?

      doc.xpath('//album')[0].content.gsub("\r\n", '').strip
    end
  end
end
