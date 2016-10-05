require 'rails_helper'

feature 'user visits home with menu' do
  scenario 'successfully' do
    visit root_path

    click_link 'ONGs'
    click_link 'Pets'

    expect(page).to have_content('AdoPet')
  end
end
