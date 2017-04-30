require 'rails_helper'
feature 'user signup' do
  scenario 'from home page' do
    user = build(:user)

    visit root_path
    click_on 'Criar Usuário'

    fill_in :user_name, with: user.name
    fill_in :user_email, with: user.email
    fill_in :user_password, with: user.password
    fill_in :user_password_confirmation, with:  user.password
    fill_in :user_address_attributes_state, with: user.address.state
    fill_in :user_address_attributes_city, with: user.address.city
    fill_in :user_phone, with: user.phone
    fill_in :user_address_attributes_address, with: user.address.address

    click_on 'Cadastrar conta'

    within('header') do
      expect(page).to have_content user.email
    end
  end
end
