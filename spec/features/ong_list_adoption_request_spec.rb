require 'rails_helper'

feature 'ong see list of request adoption' do
  scenario 'successfully' do
    user = login
    ong = ong_login
    pet = create(:pet, ong: ong)

    destroy_user_session_path

    adoption_received = create(:adoption, user: user, pet: pet, ong: ong)
    create(:adoption, user: user, pet: pet, ong: ong, status: 2)
    create(:adoption, user: user, pet: pet, ong: ong, status: 1)

    visit ong_path(ong)
    expect(page).to have_content 'Solicitações de adoções'

    within '.adoptions' do
      expect(page).to have_selector('.adopt-request', count: 1)

      within '.adopt-request' do
        expect(page).to have_content adoption_received.user.name
        expect(page).to have_content adoption_received.user.email
        expect(page).to have_content adoption_received.user.phone
        expect(page).to have_content 'Solicitada'
      end
    end
  end

  scenario 'user see list and update adopt request' do
    user = login
    ong = ong_login
    pet = create(:pet, ong: ong)

    destroy_user_session_path

    create(:adoption, user: user, pet: pet, ong: ong)

    visit ong_path(ong)
    expect(page).to have_content 'Solicitações de adoções'

    within '.adoptions' do
      expect(page).to have_selector('.adopt-request', count: 1)

      within '.adopt-request' do
        click_on 'Salvar'
      end
    end
  end
end
