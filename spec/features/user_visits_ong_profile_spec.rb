require 'rails_helper'

feature 'user visits ong profiles' do
  scenario 'successfuly' do
    user = create(:user)
    address = create(:address)
    ong = create(:ong, user: user, address: address)
    create(:pet, ong: ong)

    visit ong_path ong

    expect(page).to have_content ong.name
    expect(page).to have_content ong.phone
    expect(page).to have_content ong.email
    expect(page).to have_content ong.site
    expect(page).to have_content ong.address.city
    expect(page).to have_content ong.address.state
  end
end
