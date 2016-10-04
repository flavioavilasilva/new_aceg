require 'rails_helper'
feature 'User create ong' do
  scenario 'successfuly' do
    ong = create(:ong)

    visit new_ong_path

    fill_in 'Cnpj', with: ong.cnpj
    fill_in 'Nome', with: ong.name
    fill_in 'Rua', with: ong.street
    fill_in 'Numero', with: ong.number
    fill_in 'Bairro', with: ong.neighborhood
    fill_in 'Cep', with: ong.zipcode
    fill_in 'Estado', with: ong.state
    fill_in 'Cidade', with: ong.city
    fill_in 'Email', with: ong.email
    fill_in 'Telefone', with: ong.phone
    fill_in 'Contato', with: ong.contact
    check 'Recebe Pets'
    fill_in 'Site', with: ong.site

    click_on 'Cadastrar Ong'

    expect(page).to have_content ong.name
    expect(page).to have_content ong.cnpj
    expect(page).to have_content ong.street
    expect(page).to have_content ong.number
    expect(page).to have_content ong.neighborhood
    expect(page).to have_content ong.zipcode
    expect(page).to have_content ong.state
    expect(page).to have_content ong.city
    expect(page).to have_content ong.email
    expect(page).to have_content ong.phone
    expect(page).to have_content ong.contact
    expect(page).to have_content ong.site
    expect(page).to have_content 'Aceita Pets'
  end

  scenario 'nao aceita Pet' do
    ong = create(:ong)
    visit new_ong_path

    fill_in 'Cnpj', with: ong.cnpj
    fill_in 'Nome', with: ong.name
    fill_in 'Rua', with: ong.street
    fill_in 'Numero', with: ong.number
    fill_in 'Bairro', with: ong.neighborhood
    fill_in 'Cep', with: ong.zipcode
    fill_in 'Estado', with: ong.state
    fill_in 'Cidade', with: ong.city
    fill_in 'Email', with: ong.email
    fill_in 'Telefone', with: ong.phone
    fill_in 'Contato', with: ong.contact
    fill_in 'Site', with: ong.site

    click_on 'Cadastrar Ong'

    expect(page).to have_content 'Não aceita Pets'
  end
  scenario 'unsuccessfuly' do
    visit new_ong_path

    fill_in 'Cnpj', with: ''
    fill_in 'Nome', with: ''
    fill_in 'Rua', with: ''
    fill_in 'Numero', with: ''
    fill_in 'Bairro', with: ''
    fill_in 'Cep', with: ''
    fill_in 'Estado', with: ''
    fill_in 'Cidade', with: ''
    fill_in 'Email', with: ''
    fill_in 'Telefone', with: ''
    fill_in 'Contato', with: ''
    fill_in 'Site', with: ''

    click_on 'Cadastrar Ong'

    expect(page).to have_content 'Campos com (*) são obrigatórios'
  end
end
