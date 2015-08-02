require 'spec_helper'

describe LyricFind do
  before(:all) do
    File.open('spec/lyricfind.yml') do |yml|
      loaded = YAML::load(yml)
      @api_key_search = loaded['search_key']
      @api_key_display = loaded['display_key']
    end
  end

  before(:each) do
    @lf = LyricFind::API.new @api_key_search, @api_key_display
  end

  describe "positive cases" do
    it 'has a version number' do
      expect(LyricFind::VERSION).not_to be nil
    end

    it 'returns lyrics when given a song name' do
      VCR.use_cassette "song_exists" do
        lyrics = @lf.get_lyrics_by_song_name 'u2', 'one'
        expect(lyrics.length).to be > 0
      end
    end

    it 'correctly states that a song is not instrumental' do
      VCR.use_cassette "song_exists" do
        expect(@lf.instrumental? 'u2', 'one') == false
      end
    end

    it 'returns the duration of the song' do
      VCR.use_cassette "song_exists" do
        expect(@lf.duration 'u2', 'one').to eq '4:36'
      end
    end

    it 'returns the name of the album' do
      VCR.use_cassette "song_exists" do
        expect(@lf.album 'u2', 'one').to eq 'Achtung Baby        U2'
      end
    end

    it 'returns the snippet' do
      VCR.use_cassette "song_exists" do
        lyrics = @lf.get_snippet_by_song_name 'u2', 'one'
        expect(lyrics.length).to be > 0
      end
    end

    it 'returns a populated song object' do
      VCR.use_cassette "song_exists" do
        song = @lf.get_song_info 'u2', 'one'
        expect(song.lyrics.length).to be > 0
        expect(song.instrumental).to eq false
      end
    end
  end

  describe "negative cases" do
    VCR.use_cassette "non_existent_song" do
      it 'does not return lyrics when given a non-existent song name' do
        lyrics = @lf.get_lyrics_by_song_name 'u2', 'zbubu'
        expect(lyrics).to be nil
      end
    end

    it 'does not return lyrics when given a null song name' do
      VCR.use_cassette "bad_data" do
        lyrics = @lf.get_lyrics_by_song_name 'u2', nil
        expect(lyrics).to be nil
      end
    end

    it 'does not return lyrics when given a null artist name' do
      VCR.use_cassette "bad_data" do
        lyrics = @lf.get_lyrics_by_song_name nil, 'one'
        expect(lyrics).to be nil
      end

    end

    it 'does not return lyrics when given a blank song name' do
      VCR.use_cassette "bad_data" do
        lyrics = @lf.get_lyrics_by_song_name 'u2', ''
        expect(lyrics).to be nil
      end
    end

    it 'does not return lyrics when given a blank artist name' do
      VCR.use_cassette "bad_data" do
        lyrics = @lf.get_lyrics_by_song_name '', 'one'
        expect(lyrics).to be nil
      end
    end
  end

end
