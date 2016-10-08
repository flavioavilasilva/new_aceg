require 'rails_helper'

feature 'User visits home' do
  scenario 'and see pets' do
    user = create(:user)
    ong = create(:ong, user: user)
    pet = create(:pet, ong: ong)

    visit root_path

    within '.item' do
      expect(page).to have_content pet.name
      expect(page).to have_content pet.age
      expect(page).to have_content pet.gender
      expect(page).to have_content pet.size
    end
  end

  scenario 'and user is logged in' do
    login
    expect(page).to have_content 'Cadastre sua ONG'
  end

  scenario 'and see 5 ongs and 5 pets from that ongs' do
    user = create(:user)
    ongs = create_list(:ong, 6, user: user)

    ongs.each do |ong|
      create_list(:pet, 10, ong: ong)
    end
    visit root_path

    within '#ongs' do
      expect(page).to have_selector('#ong', count: 5)
      expect(page).to have_selector('#pet', count: 25)
    end
  end
end
