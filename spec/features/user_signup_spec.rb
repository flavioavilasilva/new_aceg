require 'rails_helper'
feature 'user sign' do
  scenario 'from home page' do
      user  = build(:user)
       visit root_path

       click_on 'Criar conta'

       fill_in 'Email', with: user.email
       fill_in 'Senha', with: user.password
       fill_in 'Confirmação de senha', with:  user.password

       click_on 'Cadastrar conta'

      within('nav') do
        expect(page).to have_content user.email
      end
  end
end
