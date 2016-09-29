require 'rails_helper'

feature 'User visits home' do
  scenario 'successfuly' do
    pet = create(:pet)

    visit root_path

    expect(page).to have_content pet.name
    expect(page).to have_content pet.age
    expect(page).to have_content pet.gender
    expect(page).to have_content pet.size
  end
end
