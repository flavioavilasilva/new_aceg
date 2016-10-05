require 'rails_helper'

feature 'User adopt pet' do
  scenario ' ' do
    ong = create(:ong)
    pet = create(:pet, ong: ong)
    user = create(:user)

    visit pets_path(pet)

    count_before = Adoption.count

    click_on 'Adotar'

    count_after = Adoption.count

    expect(count_after) > 0
    expect(page).to have_content 'Sua solicitação de adoção foi registrada e será analisada!'
  end
end
