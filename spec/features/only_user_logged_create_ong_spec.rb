require 'rails_helper'

feature 'only user logged creates ong' do
  scenario 'successfully' do
    user = create(:user)

    visit root_path

    click_on 'Login'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    click_on 'Entrar'

    click_on 'Cadastre sua ONG'

    expect(page).to have_content 'Cadastrar ONG'
  end
  scenario 'unsuccessfully' do

    visit root_path

    click_on 'Cadastre sua ONG'

    expect(page).to have_content 'Para criar ONGs é preciso estar logado'
    expect(page).to have_content 'Log in'
    expect(page).to have_content 'Cadastre sua conta'

  end
end
