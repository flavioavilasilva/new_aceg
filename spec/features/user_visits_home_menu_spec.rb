require 'rails_helper'

feature 'user visits home with menu' do
  scenario 'successfully' do
    visit root_path

    click_link 'ONGs'
    click_link 'Pets'

    within 'form' do
      select 'cidade', from: 'São Paulo'
    end

    expect(page).to have_content('AdoPet')
  end
end
