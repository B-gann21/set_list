require 'rails_helper'

RSpec.describe 'the songs show page' do
  it 'shows an individual song' do
    artist = Artist.create!(name: "Bippity Boop")
    song = artist.songs.create!(title: "I really like you", length: 208, play_count: 230)
    song2 = artist.songs.create!(title: "Skibbity Bop", length: 2000, play_count: 230000)
    visit "/songs/#{song.id}"

    expect(page).to have_content(song.title)
    expect(page).to_not have_content(song2.title)
  end

  it 'shows the name of the artist who wrote the song' do
    artist = Artist.create!(name: "Bippity Boop")
    song = artist.songs.create!(title: "I really like you", length: 208, play_count: 230)
    song2 = artist.songs.create!(title: "Skibbity Bop", length: 2000, play_count: 230000)
    visit "/songs/#{song.id}"

    expect(page).to have_content(artist.name)
  end
end
