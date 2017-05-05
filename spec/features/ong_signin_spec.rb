require 'rails_helper'
feature 'user sign in' do
  scenario 'successfully' do
    ong = create(:ong)

    visit root_path

    click_on 'Login ONG'

    fill_in 'Email', with: ong.email
    fill_in 'Senha', with: ong.password

    click_on 'Entrar'

    expect(page).to have_no_content 'Criar ONG'
    expect(page).to have_no_content 'Login Usuário'
    expect(page).to have_no_content 'Login ONG'

    expect(page).to have_content 'Logoff'
    expect(page).to have_content 'Editar conta'
    within('header') do
      expect(page).to have_content ong.email
    end
  end
end
