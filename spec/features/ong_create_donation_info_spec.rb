require 'rails_helper'

feature 'ong creates donation information bank' do
  scenario 'successfully' do
    ong = ong_login
    visit ong_path ong

    click_on 'Doações'

    donation = build(:information_bank)

    click_on "Incluir dados doação"

    fill_in 'CNPJ', with: donation.cnpj
    fill_in 'Banco', with: donation.bank
    fill_in 'Agência', with: donation.agency
    fill_in 'Conta', with: donation.account_number

    click "Enviar"

    expect(page).to have_content donation.cnpj
    expect(page).to have_content donation.bank
    expect(page).to have_content donation.agency
    expect(page).to have_content donation.cnpj
  end
end
