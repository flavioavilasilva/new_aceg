require 'rails_helper'

feature 'ong provide pet' do
  scenario 'successfully' do
    ong = ong_login
    pet = build(:pet, ong: ong)

    visit ong_path ong

    click_on 'Incluir Pet'

    fill_in 'Nome',        with: pet.name
    fill_in 'Idade',       with: pet.age
    select 'Mes/Meses',    from: 'scala_idade'
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
