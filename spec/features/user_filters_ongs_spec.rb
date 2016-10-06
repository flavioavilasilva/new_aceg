require 'rails_helper'

feature 'user filters ongs' do
  scenario 'the user filter ong from root path' do
    user = create(:user)
    ongs_diadema = create_list(:ong, 3, city: 'Diadema', user: user)
    ongs_santos = create_list(:ong, 10, city: 'Santos', user: user)

    visit root_path
    select 'Diadema', from: 'Cidade'

    click_on 'Filtrar'

    expect(current_url).to have_content(ongs_path)
    expect(page).to have_content('Filtrando ONGs de Diadema')
    ongs_diadema.each do |ong|
      expect(page).to have_content(ong.name)
    end

    ongs_santos.each do |ong|
      expect(page).not_to have_content(ong.name)
    end
  end

  scenario 'should show a message when user filter a city without ong' do
    user = create(:user)
    create_list(:ong, 2, city: 'Diadema', user: user)
    visit '/ongs?city=Santos'

    expect(page).to have_content('Nenhuma ONG encontrada para esta cidade')
  end

  scenario 'when user dont specify a city it should show all ONGs' do
    user = create(:user)
    ongs = create_list(:ong, 3, user: user)
    visit ongs_path
    expect(page).to have_selector('.ong', count: 3)

    ongs.each do |ong|
      expect(page).to have_content(ong.name)
    end
  end
end
