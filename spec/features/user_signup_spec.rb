require 'rails_helper'
feature 'user signup' do
  scenario 'from home page' do
    user = build(:user)

    visit root_path
    click_on 'Criar Usuário'

    fill_in 'Nome',                 with: user.name
    fill_in 'E-mail',               with: user.email
    fill_in 'Senha',                with: user.password
    fill_in 'Confirmação de senha', with:  user.password
    fill_in 'Telefone',             with: user.phone
    fill_in 'CEP',                  with: user.address.postal_code
    fill_in 'Estado',               with: user.address.state
    fill_in 'Cidade',               with: user.address.city
    fill_in 'Rua',                  with: user.address.address
    fill_in 'Número',               with: user.address.address_number
    fill_in 'Bairro',               with: user.address.neighborhood

    click_on 'Cadastrar conta'

    within('header') do
      expect(page).to have_content user.email
    end
  end
end
