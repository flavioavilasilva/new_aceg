require 'rails_helper'
feature 'ONG edit pet' do
  scenario 'successfuly' do
    ong = ong_login
    pet = create(:pet, ong: ong)

    visit ong_pet_path(ong, pet)

    click_on 'Editar'

    expect(find_field('Nome').value).to eq pet.name

    fill_in 'Nome', with: 'Ester'

    click_on 'Enviar'

    expect(page).to have_content 'Ester'
  end
end
