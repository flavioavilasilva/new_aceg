require 'rails_helper'
feature 'user signup' do
  scenario 'from home page' do
    user = build(:user)

    visit root_path

    click_on 'Criar conta'

    fill_in 'Nome', with: user.name
    fill_in 'Email', with: user.email
    fill_in 'Senha', with: user.password
    fill_in 'Confirmação de senha', with:  user.password
    fill_in 'Estado', with: user.address.state
    fill_in 'Cidade', with: user.address.city
    fill_in 'Telefone', with: user.phone
    fill_in 'Endereço', with: user.address.address

    save_and_open_page
    binding.pry
    click_on 'Cadastrar conta'

    within('header') do
      expect(page).to have_content user.email
    end
  end
end
