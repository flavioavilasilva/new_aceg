require 'rails_helper'

feature 'user visits ong profiles' do
  scenario 'current user loged like ong' do
    ong = ong_login
    create(:pet, ong: ong)
    visit ong_path ong

    expect(page).to have_content ong.name
    expect(page).to have_content ong.phone
    expect(page).to have_content ong.email
    expect(page).to have_content ong.site
    expect(page).to have_content ong.address.city
    expect(page).to have_content ong.address.state

    expect(page).to have_link 'Criar Evento'
  end

  scenario 'current user not loged like ong' do
    ong = create(:ong)
    create(:pet, ong: ong)
    visit ong_path ong

    expect(page).to have_content ong.name
    expect(page).to have_content ong.phone
    expect(page).to have_content ong.email
    expect(page).to have_content ong.site
    expect(page).to have_content ong.address.city
    expect(page).to have_content ong.address.state

    expect(page).to have_no_link 'Criar Evento'
  end

  scenario 'current user loged like ong, but on other page ong' do
    ong = ong_login
    ong_not_loged = create(:ong)
    create(:pet, ong: ong)
    visit ong_path ong_not_loged

    expect(page).to have_content ong_not_loged.name
    expect(page).to have_content ong_not_loged.phone
    expect(page).to have_content ong_not_loged.email
    expect(page).to have_content ong_not_loged.site
    expect(page).to have_content ong_not_loged.address.city
    expect(page).to have_content ong_not_loged.address.state

    expect(page).to have_no_link 'Criar Evento'
  end
end
