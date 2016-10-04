require 'rails_helper'

feature 'User visits home' do
  scenario 'and see pets' do
    pet = create(:pet)

    visit root_path
    within '.pets' do
      expect(page).to have_content pet.name
      expect(page).to have_content pet.age
      expect(page).to have_content pet.gender
      expect(page).to have_content pet.size
    end
  end

  scenario 'and see 5 ongs ant 5 pets from that ongs' do
    ongs = create_list(:ong, 6)

    ongs.each do |ong|
      create_list(:pet, 10, ong: ong)
    end
    visit root_path
    within '#ongs' do
      expect(page).to have_selector('.ong', count: 5)

      within(:xpath, '//div[@class="ong"][1]') do
        expect(page).to have_selector('.pets', count: 5)
        expect(page).to have_selector('img')
      end
    end
  end
end
