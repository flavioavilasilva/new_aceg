require 'rails_helper'

feature 'visitor see the pet profile' do
  scenario 'successfully' do
    user = create(:user)
    ong = create(:ong, user: user)
    pet = build(:pet, ong: ong)

    visit new_pet_path

    fill_in 'Nome',        with: pet.name
    fill_in 'Idade',       with: pet.age
    select 'Grande',       from: 'Porte'
    choose 'Cachorro'
    fill_in 'Raça', with: pet.breed
    choose 'Macho'
    check 'Vacinado'
    fill_in 'Deficiencia', with: pet.deficiency
    check 'Castrado'
    fill_in 'Descrição',   with: pet.description
    select ong.name,       from: 'Ong'

    click_on 'Enviar'

    expect(page).to have_content(pet.name)
    expect(page).to have_content(pet.age)
    expect(page).to have_content('Grande')
    expect(page).to have_content('Cachorro')
    expect(page).to have_content(pet.breed)
    expect(page).to have_content(pet.gender)
    expect(page).to have_content(pet.deficiency)
    expect(page).to have_content(pet.description)
    expect(page).to have_xpath('//img')
  end

  scenario 'should fill mandatory fields' do
    user = create(:user)
    ong = create(:ong, user: user)
    pet = build(:pet, ong: ong)

    visit new_pet_path
    fill_in 'Nome', with: pet.name
    fill_in 'Raça', with: pet.breed
    click_on 'Enviar'
    expect(page).to have_content('Campos com (*) são obrigatórios')
  end
end
