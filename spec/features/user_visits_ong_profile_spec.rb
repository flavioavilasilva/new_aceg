require 'rails_helper'

feature 'user visits ong profiles' do
  scenario 'successfuly' do
    ong = create(:ong)
    create(:pet, ong: ong)

    visit ong_path ong

    expect(page).to have_content ong.name
    expect(page).to have_content ong.address
    expect(page).to have_content ong.phone
    expect(page).to have_content ong.email
    expect(page).to have_content ong.site
  end
end
