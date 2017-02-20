require 'rails_helper'
feature 'User create ong' do
  scenario 'successfuly' do
    login
    address = build(:address, latitude:-23.6797034, longitude:-46.7129943)
    ong = build(:ong, address: address)

    visit new_ong_path

    fill_in 'CNPJ',     with: ong.cnpj
    fill_in 'Nome', with: ong.name
    fill_in 'Logradouro', with: ong.address.address
    fill_in 'Número e complemento', with: ong.address.address_number
    fill_in 'CEP',      with: ong.address.postal_code
    fill_in 'Estado',   with: ong.address.state
    fill_in 'Cidade',   with: ong.address.city
    fill_in 'E-mail',    with: ong.email
    fill_in 'Telefone', with: ong.phone
    fill_in 'Contato',  with: ong.contact
    fill_in 'Descreva sua ONG',  with: ong.description
    check   'Recebe Pets'
    fill_in 'Site',     with: ong.site

    click_on("btn_cadastrar_ong")

    save_and_open_page

    expect(page).to have_content ong.name
    expect(page).to have_content ong.cnpj
    expect(page).to have_content ong.address.address
    expect(page).to have_content ong.address.address_number
    expect(page).to have_content ong.address.postal_code
    expect(page).to have_content ong.address.state
    expect(page).to have_content ong.address.city
    expect(page).to have_content ong.email
    expect(page).to have_content ong.phone
    expect(page).to have_content ong.contact
    expect(page).to have_content ong.site
    expect(page).to have_content ong.description
    expect(page).to have_content 'Sim'
  end

  scenario 'nao aceita Pet' do
    login
    ong = build(:ong)
    visit new_ong_path

    fill_in 'CNPJ',     with: ong.cnpj
    fill_in 'Nome',     with: ong.name
    fill_in 'Logradouro', with: ong.address.address
    fill_in 'Número e complemento', with: ong.address.address_number
    fill_in 'CEP',      with: ong.address.postal_code
    fill_in 'Estado',   with: ong.address.state
    fill_in 'Cidade',   with: ong.address.city
    fill_in 'E-mail',    with: ong.email
    fill_in 'Telefone', with: ong.phone
    fill_in 'Contato',  with: ong.contact
    fill_in 'Site',     with: ong.site
    uncheck 'Recebe Pets'

    click_on("btn_cadastrar_ong")

    expect(page).to have_content 'Não'
  end
  scenario 'unsuccessfuly' do
    login
    visit new_ong_path

    fill_in 'CNPJ',     with: ''
    fill_in 'Nome',     with: ''
    fill_in 'Logradouro', with: ''
    fill_in 'Número',   with: ''
    fill_in 'CEP',      with: ''
    fill_in 'Estado',   with: ''
    fill_in 'Cidade',   with: ''
    fill_in 'E-mail',    with: ''
    fill_in 'Telefone', with: ''
    fill_in 'Contato',  with: ''
    fill_in 'Site',     with: ''

    click_on("btn_cadastrar_ong")

    expect(page).to have_content 'Campos com (*) são obrigatórios'
  end

  scenario 'and view only my ONGs' do
    another_user = create(:user)
    another_ong = create(:ong, user: another_user)

    login
    ong = build(:ong)
    visit new_ong_path

    fill_in 'CNPJ',     with: ong.cnpj
    fill_in 'Nome',     with: ong.name
    fill_in 'Logradouro', with: ong.address.address
    fill_in 'Número',   with: ong.address.address_number
    fill_in 'CEP',      with: ong.address.postal_code
    fill_in 'Estado',   with: ong.address.state
    fill_in 'Cidade',   with: ong.address.city
    fill_in 'E-mail',    with: ong.email
    fill_in 'Telefone', with: ong.phone
    fill_in 'Contato',  with: ong.contact
    check   'Recebe Pets'
    fill_in 'Site',     with: ong.site

    click_on("btn_cadastrar_ong")

    click_on 'Minhas ONGs'

    expect(page).to have_content ong.name
    expect(page).not_to have_content another_ong.name
  end
end
