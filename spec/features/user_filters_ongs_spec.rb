require 'rails_helper'

feature 'user filters ongs' do
  scenario 'the user filter ong from root path' do
    ongs_diadema = create_list(:ong, 3, city: 'Diadema')
    ongs_santos = create_list(:ong, 10, city: 'Santos')

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
    create_list(:ong, 2, city: 'Diadema')
    visit '/ongs?city=Santos'

    expect(page).to have_content('Nenhuma ONG encontrada para esta cidade')
  end
end
