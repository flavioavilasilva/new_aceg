require 'rails_helper'

feature 'User visits my ongs' do
  scenario 'and see create event and insert pets button' do
    user = login
    create(:ong, user: user)

    visit minhas_ongs_path
    expect(page).to have_content 'Criar Evento'
    expect(page).to have_content 'Cadastrar Pets'
  end
end
