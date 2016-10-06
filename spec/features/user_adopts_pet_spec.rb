require 'rails_helper'

feature 'User adopt pet' do
  scenario 'successfuly' do
    ong = create(:ong)
    pet = create(:pet, ong: ong)
    user = login
    adoption = build(:adoption)

    visit pet_path(pet)

    click_on 'Adotar'

    expect(page).to have_content 'Sua solicitação de adoção foi registrada e será analisada!'
    expect(page).to have_content adoption.pet.name
    expect(page).to have_content adoption.pet.ong.name
    expect(page).to have_content adoption.status
  end
end
