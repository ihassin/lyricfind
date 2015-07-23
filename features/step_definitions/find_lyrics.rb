require 'lyricfind'
require 'pp'

Given(/^I have a license to use LyricFind$/) do
  File.open('spec/lyricfind.yml') do |yml|
    loaded = YAML::load(yml)
    @api_key_search = loaded['search_key']
    @api_key_display = loaded['display_key']
    @lf = LyricFind::API.new @api_key_search, @api_key_display
  end
end

When(/^I search for "([^"]*)" song "([^"]*)"$/) do |band, song_name|
  VCR.use_cassette "song_cucumber" do
    @lyrics = @lf.get_lyrics_by_song_name band, song_name
  end
end

Then(/^its lyrics are returned$/) do
  expect(@lyrics).to match(/Is it getting better/)
end
