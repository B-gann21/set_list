require 'rails_helper'

RSpec.describe 'Artists#edit' do
  it 'links to the edit page' do
    artist = Artist.create!(name: "Prince")
    visit '/artists'

    click_button "Edit #{artist.name}"

    expect(current_path).to eq("/artists/#{artist.id}/edit")
  end
end
