require 'rails_helper'
feature 'ong send message' do
  scenario 'para todas as ongs' do
    ong = ong_login

    visit root_path
    click_on 'Mensagens'

    expect(page).to have_selector("h3", text: 'Mensagens')

    check 'Para todas as ONG\'s?'
    fill_in 'Assunto', with: 'Preciso do rémedio tal'
    fill_in 'Mensagem', with: 'Mesangem de teste'
    click_on 'Enviar'

    expect(page).to have_content 'Mensagem enviada com sucesso!'
  end
end
