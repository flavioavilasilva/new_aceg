require 'rails_helper'
feature 'user visit who we are' do
  scenario 'from home page he acess who we are page' do
    visit root_path

    click_on 'QUEM SOMOS'

    expect(page).to have_content 'Quem somos'
  end
end
