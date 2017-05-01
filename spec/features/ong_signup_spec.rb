require 'rails_helper'
feature 'ong signup' do
  scenario 'from home page' do
    ong = build(:ong)

    visit root_path
    click_on 'Criar ONG'

    fill_in 'Nome', with: ong.name
    fill_in 'E-mail', with: ong.email
    fill_in 'CNPJ', with: ong.cnpj
    fill_in 'Telefone', with: ong.phone
    fill_in 'Senha', with: ong.password
    fill_in 'Confirmação de senha', with:  ong.password
    fill_in 'CEP', with: ong.address.postal_code
    fill_in 'Estado', with: ong.address.state
    fill_in 'Cidade', with: ong.address.city
    fill_in 'Rua', with: ong.address.address
    fill_in 'Bairro', with: ong.address.neighborhood
    fill_in 'Número', with: ong.address.address_number

    click_on 'Cadastrar conta'

    within('header') do
      expect(page).to have_content ong.email
    end

    expect(page.current_url).to have_content 'ongs/'
  end
end
