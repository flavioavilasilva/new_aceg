require 'rails_helper'
feature 'user sign in' do
  scenario 'successfully' do
    user = create(:user)

    visit root_path

    click_on 'Login Usuário'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    click_on 'Entrar'

    expect(page).to have_no_content 'Cadastrar conta'
    expect(page).to have_no_content 'Login Usuário'
    expect(page).to have_content 'Logoff'
    expect(page).to have_content 'Editar conta'
    within('header') do
      expect(page).to have_content user.email
    end
  end
end
