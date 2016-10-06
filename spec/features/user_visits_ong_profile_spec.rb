require 'rails_helper'

feature 'user visits ong profiles' do
  scenario 'successfuly' do
    user = create(:user)
    ong = create(:ong, user: user)
    create(:pet, ong: ong)

    visit ong_path ong

    expect(page).to have_content ong.name
    expect(page).to have_content ong.phone
    expect(page).to have_content ong.email
    expect(page).to have_content ong.site
    expect(page).to have_content ong.city
    expect(page).to have_content ong.state
  end
end
