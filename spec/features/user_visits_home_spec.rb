require 'rails_helper'

feature 'User visits home' do
  scenario 'must have ong sig up button' do
    visit root_path
    expect(page).to have_content 'Criar ONG'
  end

  scenario 'and see 3 ongs' do
    address1 = create(:address, latitude:-23.550756.freeze, longitude:-46.632970.freeze)
    ong1 = create(:ong, name: 'ong1', address: address1)

    address3 = create(:address, latitude:-23.582420.freeze, longitude:-46.645826.freeze)
    ong3 = create(:ong, name: 'ong3', address: address3)

    address2 = create(:address, latitude:-23.551956.freeze, longitude:-46.636607.freeze)
    ong2 = create(:ong, name: 'ong2', address: address2)

    visit root_path

    within '#ongs' do
      expect(page.all(:xpath, '//div[@class="panel panel-default"]')[0]).to have_content('ong1')
      expect(page.all(:xpath, '//div[@class="panel panel-default"]')[1]).to have_content('ong2')
      expect(page.all(:xpath, '//div[@class="panel panel-default"]')[2]).to have_content('ong3')
    end
  end

  scenario 'should list the 3 oldets pets' do
    address = create(:address, latitude:-23.550756, longitude:-46.632970)
    ong = create(:ong, address: address)
    pet1 = create(:pet, ong: ong, created_at: (DateTime.now - 10).in_time_zone)
    pet2 = create(:pet, ong: ong, created_at: (DateTime.now - 5).in_time_zone)
    pet3 = create(:pet, ong: ong, created_at: (DateTime.now - 2).in_time_zone)
    pet4 = create(:pet, ong: ong)
    pet5 = create(:pet, ong: ong)
    pet6 = create(:pet, ong: ong)
    pet7 = create(:pet, ong: ong)
    pet8 = create(:pet, ong: ong)

    visit root_path

    within '#ongs' do
      expect(page).to have_content(pet1.name)
      expect(page).to have_content(pet2.name)
      expect(page).to have_content(pet3.name)
      expect(page).not_to have_content(pet4.name)
      expect(page).not_to have_content(pet5.name)
      expect(page).not_to have_content(pet6.name)
      expect(page).not_to have_content(pet7.name)
      expect(page).not_to have_content(pet8.name)
    end
  end

  scenario 'should list the next 3 events' do
    address = create(:address, latitude:-23.550756, longitude:-46.632970)
    ong = create(:ong, address: address)
    ong2 = create(:ong, address: address)

    event1 = create(:event, ong: ong, datetime: DateTime.new(2011, 2, 7, 0,
                                                             0, 0).in_time_zone)
    event2 = create(:event, ong: ong2, datetime: DateTime.new(2012, 9, 8, 0, 0,
                                                              0).in_time_zone)
    event3 = create(:event, ong: ong, datetime: (DateTime.now + 3).in_time_zone)
    event4 = create(:event, ong: ong2, datetime: DateTime.new(2014, 5, 7, 0, 0,
                                                              0).in_time_zone)
    event5 = create(:event, ong: ong, datetime: (DateTime.now + 5).in_time_zone)
    event6 = create(:event, ong: ong2, datetime:(DateTime.now + 6).in_time_zone)
    event7 = create(:event, ong: ong2, datetime: DateTime.new(2014, 9, 12, 0, 0,
                                                              0).in_time_zone)
    visit root_path

    within '#events' do
      expect(page).to have_content(event3.name)
      expect(page).to have_content(event5.name)
      expect(page).to have_content(event6.name)

      expect(page).not_to have_content(event1.name)
      expect(page).not_to have_content(event2.name)
      expect(page).not_to have_content(event4.name)
      expect(page).not_to have_content(event7.name)
    end
  end
end
