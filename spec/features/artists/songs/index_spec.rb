require 'rails_helper'

RSpec.describe "Artists songs index" do
  before :each do
    @prince = Artist.create!(name: 'Prince')
    @purple = @prince.songs.create(title: 'Purple Rain', length: 500, play_count: 900)
    @beret = @prince.songs.create(title: 'Raspberry Beret', length: 540, play_count: 9000)
  end

  it 'shows all songs for the artist' do
    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content(@purple.title)
    expect(page).to have_content(@beret.title)
  end

  it 'links to each songs show page' do
    visit "/artists/#{@prince.id}/songs"

    click_on @purple.title

    expect(current_path).to eq("/songs/#{@purple.id}")
  end

  it 'shows the average song length for the artist' do
    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content("Average song length for Prince: 520")
  end
end
