require 'rails_helper'

feature 'User adopt pet' do
  scenario 'successfuly' do
    user = login
    ong = create(:ong, user: user)
    pet = create(:pet, ong: ong)

    adoption = build(:adoption, pet: pet, user: user)

    visit pet_path(pet)

    click_on 'Adotar'

    expect(page).to have_content "Sua solicitação de adoção foi registrada /n
    e será analisada!"
    expect(page).to have_content adoption.pet.name
    expect(page).to have_content adoption.pet.ong.name
    expect(page).to have_content adoption.pet.ong.phone
    expect(page).to have_content adoption.status
  end

  scenario 'user is not loged' do
    user_not_log_in = create(:user)
    ong = create(:ong, user: user_not_log_in)
    pet = create(:pet, ong: ong)

    visit pet_path(pet)

    click_on 'Adotar'

    expect(page).to have_content 'É necessário estar logado!'
  end
end
