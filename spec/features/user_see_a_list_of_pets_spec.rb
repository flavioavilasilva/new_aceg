require 'rails_helper'

feature 'user see a list of pets' do
  scenario 'successfully' do
    ongs = create_list(:ong, 3, user: create(:user))
    ongs.each do |ong|
      ong.pets = create_list(:pet, 5, ong: ong)
    end
    visit pets_path
    Pet.all.each do |pet|
      expect(page).to have_content(pet.name)
    end
  end
end
