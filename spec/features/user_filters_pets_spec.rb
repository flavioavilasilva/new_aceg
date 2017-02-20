# require 'rails_helper'
#
# feature 'user filters pets' do
#   scenario 'the user filter pets from root path' do
#     user = create(:user)
#     ong_diadema = create(:ong, city: 'Diadema', user: user)
#     pets_diadema = create_list(:pet, 3, ong: ong_diadema)
#     ong_santos = create(:ong, city: 'Santos', user: user)
#     pets_santos = create_list(:pet, 3, ong: ong_santos)
#
#     visit root_path
#
#     select 'Diadema', from: 'Cidade'
#
#     click_on 'Filtrar'
#
#     expect(current_url).to have_content(pets_path)
#     expect(page).to have_content('Filtrando Pets de Diadema')
#     pets_diadema.each do |pet|
#       expect(page).to have_content(pet.name)
#     end
#
#     pets_santos.each do |pet|
#       expect(page).not_to have_content(pet.name)
#     end
#   end
#
#   scenario 'should show a message when user filter a city without ong' do
#     user = create(:user)
#     create_list(:ong, 2, city: 'Diadema', user: user)
#     visit '/ongs?city=Santos'
#
#     expect(page).to have_content('Nenhuma ONG encontrada para esta cidade')
#   end
#
#   scenario 'when user dont specify a city it should show all ONGs' do
#     user = create(:user)
#     ongs = create_list(:ong, 3, user: user)
#     visit ongs_path
#     expect(page).to have_selector('.ong', count: 3)
#
#     ongs.each do |ong|
#       expect(page).to have_content(ong.name)
#     end
#   end
# end
