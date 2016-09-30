require 'rails_helper'

feature 'User visits home' do
  scenario 'and see pets' do
    pet = create(:pet)

    visit root_path

    expect(page).to have_content pet.name
    expect(page).to have_content pet.age
    expect(page).to have_content pet.gender
    expect(page).to have_content pet.size
  end

  scenario 'and see 5 ongs ant 5 pets from that ongs' do
      ongs = create_list(:ong, 6)

      ongs.each do |ong|
        ong.pets = create_list(:pet, 10)
        ong.save!
      end
      binding.pry
      visit root_path
      expect(page).to have_selector( '.ong', count: 5)
  end
end
