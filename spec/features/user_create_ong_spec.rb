require 'rails_helper'
feature 'User create ong' do
  scenario 'successfuly' do
    address = build(:address, latitude:-23.6797034, longitude:-46.7129943)
    ong = build(:ong, address: address)

    visit new_ong_registration_path

    fill_in 'Senha',                with: ong.password
    fill_in 'Confirmação de senha', with:  ong.password
    fill_in 'CNPJ',                 with: ong.cnpj
    fill_in 'Nome',                 with: ong.name
    fill_in 'Rua',                  with: ong.address.address
    fill_in 'Número',               with: ong.address.address_number
    fill_in 'CEP',                  with: ong.address.postal_code
    fill_in 'Estado',               with: ong.address.state
    fill_in 'Cidade',               with: ong.address.city
    fill_in 'Bairro',               with: ong.address.neighborhood
    fill_in 'E-mail',               with: ong.email
    fill_in 'Telefone',             with: ong.phone
    fill_in 'Responsável',          with: ong.contact
    fill_in 'Descreva sua ONG',     with: ong.description
    check   'Recebe Pets?'
    fill_in 'Site',                 with: ong.site

    click_on("Cadastrar conta")
    click_on("Minha ONG")

    expect(page).to have_content ong.name
    expect(page).to have_content ong.cnpj
    expect(page).to have_content ong.address.address
    expect(page).to have_content ong.address.address_number
    expect(page).to have_content ong.address.postal_code
    expect(page).to have_content ong.address.state
    expect(page).to have_content ong.address.city
    expect(page).to have_content ong.address.neighborhood
    expect(page).to have_content ong.email
    expect(page).to have_content ong.phone
    expect(page).to have_content ong.contact
    expect(page).to have_content ong.site
    expect(page).to have_content ong.description
    expect(page).to have_content 'Sim'
  end

  scenario 'nao aceita Pet' do
    ong = build(:ong)
    visit new_ong_registration_path

    fill_in 'Senha',                with: ong.password
    fill_in 'Confirmação de senha', with: ong.password
    fill_in 'CNPJ',                 with: ong.cnpj
    fill_in 'Nome',                 with: ong.name
    fill_in 'Rua',                  with: ong.address.address
    fill_in 'Número',               with: ong.address.address_number
    fill_in 'CEP',                  with: ong.address.postal_code
    fill_in 'Estado',               with: ong.address.state
    fill_in 'Cidade',               with: ong.address.city
    fill_in 'Bairro',               with: ong.address.neighborhood
    fill_in 'E-mail',               with: ong.email
    fill_in 'Telefone',             with: ong.phone
    fill_in 'Responsável',          with: ong.contact
    fill_in 'Descreva sua ONG',     with: ong.description
    uncheck 'Recebe Pets?'
    fill_in 'Site',                 with: ong.site

    click_on("Cadastrar conta")
    click_on("Minha ONG")

    expect(page).to have_content 'Não'
  end
  scenario 'unsuccessfuly' do
    visit new_ong_registration_path

    click_on("Cadastrar conta")

    expect(page).to have_content 'Por favor, revise os problemas abaixo'
  end

end
