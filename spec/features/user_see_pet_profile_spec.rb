require 'rails_helper'

feature 'visitor see the pet profile' do
  scenario 'successfully' do
    ong = ong_login
    pet = build(:pet, ong: ong)

    visit new_ong_pet_path(ong)

    fill_in 'Nome',        with: pet.name
    fill_in 'Idade',       with: pet.age
    select 'Grande',       from: 'Porte'
    choose 'Cachorro'
    fill_in 'Raça', with: pet.breed
    choose 'Macho'
    check 'Vacinado'
    fill_in 'Deficiência', with: pet.deficiency
    check 'Castrado'
    fill_in 'Descrição', with: pet.description

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
    ong = ong_login
    pet = build(:pet, ong: ong)

    visit new_ong_pet_path(ong)
    fill_in 'Nome', with: pet.name
    fill_in 'Raça', with: pet.breed
    click_on 'Enviar'
    expect(page).to have_content('Campos com (*) são obrigatórios')
  end

  scenario 'dont show create button when current_user is not the ong creator' do
    ong = create(:ong)
    visit ong_path ong
    expect(page).not_to have_content 'Cadastrar Pets'
  end

  scenario 'when create an pet the current_user must be the ong creator' do
    ong = create(:ong)
    visit new_ong_pet_path ong
    expect(page).to have_css('h2', :text => 'Log in')
  end
end
