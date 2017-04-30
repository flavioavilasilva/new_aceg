require 'rails_helper'
feature 'user sign out' do
  scenario 'successfully' do
    user = create(:user)

    visit root_path

    click_on 'Login Usuário'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    click_on 'Entrar'

    click_on 'Logoff'

    within('header') do
      expect(page).to have_content 'Login Usuário'
    end
  end
end
