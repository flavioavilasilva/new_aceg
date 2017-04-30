require 'rails_helper'

feature 'user provide pet' do
  scenario 'successfully' do
    ong = ong_login
    pet = build(:pet, ong: ong)

    visit ong_path ong

    click_on 'Cadastrar Pets'

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
  end
end
