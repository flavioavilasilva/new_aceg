require 'rails_helper'

feature 'ong user creates a photo gallery for ong' do
  scenario 'successfully' do
    user = login
    ong = create(:ong, user: user)
    visit ong_path ong

    attach_file 'Imagem', "#{Rails.root}/spec/support/fixtures/image.jpg"
    click_on 'Enviar Imagem'

    #expect(page).to
  end
end
