require 'rails_helper'
feature 'ong signup' do
  scenario 'from home page' do
    ong = build(:ong)

    visit root_path
    click_on 'Criar ONG'

    fill_in :ong_name, with: ong.name
    fill_in :ong_email, with: ong.email
    fill_in :ong_cnpj, with: ong.cnpj
    fill_in :ong_password, with: ong.password
    fill_in :ong_password_confirmation, with:  ong.password
    fill_in :ong_address_attributes_state, with: ong.address.state
    fill_in :ong_address_attributes_city, with: ong.address.city
    fill_in :ong_phone, with: ong.phone
    fill_in :ong_address_attributes_address, with: ong.address.address

    click_on 'Cadastrar conta'

    within('header') do
      expect(page).to have_content ong.email
    end
  end
end
