require 'rails_helper'
feature 'user feedback' do
  scenario 'login user gives the feedback' do
    visit root_path
    click_on 'FEEDBACK'

    fill_in 'Nome', with: 'Fulano de tal'
    fill_in 'E-mail', with: 'fulano@teste.com.br'
    fill_in 'FeedBack', with: 'Adorei o site!'

    click_on 'Enviar FeedBack'
  end
end
