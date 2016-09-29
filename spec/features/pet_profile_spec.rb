require 'rails_helper'

feature 'visitor see the pet profile' do
  scenario 'user navigates to create pet page' do
    pending
  end
  scenario 'successfully' do
    pet = build(:pet)
    visit new_pet_path
    fill_in 'Nome', with: pet.name
    fill_in 'Idade', with: pet.age
    select 'Grande', from: 'Porte'
    select 'Cachorro', from: 'Tipo'
    fill_in 'Raça', with: pet.breed
    select 'Macho', from: 'Genero'
    select 'Sim', from: 'Vacinado'
    fill_in 'Deficiencia', with: pet.deficiency
    check 'Sim', from: 'Castrado'
    fill_in 'Descrição', with: pet.description

    click_on 'Enviar'

    expect(page).to have_content(pet.name)
    expect(page).to have_content(pet.age)
    expect(page).to have_content('Grande')
    expect(page).to have_content('Cachorro')
    expect(page).to have_content(pet.breed)
    expect(page).to have_content(pet.gender)
    expect(page).to have_content(pet.vaccines)
    expect(page).to have_content(pet.deficiency)
    expect(page).to have_content(pet.description)

  end
end
