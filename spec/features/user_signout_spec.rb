require 'rails_helper'
feature 'user sign out' do
  scenario 'successfully' do
    user = create(:user)

    visit root_path

    click_on 'Login'

    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password

    click_on 'Entrar'

    click_on 'Logoff'

    within('nav') do
      expect(page).to have_content 'Login'
    end
  end
end
