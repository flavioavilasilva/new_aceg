require 'rails_helper'

feature 'User visits home' do
  before do
    params = { lat: -23.6843221, long:-46.7155771 }
    page.driver.post('/set-location', params)
  end

  scenario 'and user is logged in' do
    login
    expect(page).to have_content 'Cadastre sua ONG'
  end

  scenario 'and see 3 ongs' do
    user = create(:user)
    address1 = create(:address, latitude:-23.6833585, longitude:-46.7144426)
    ong1 = create(:ong, name: 'ong1', user: user, address: address1)

    address3 = create(:address, latitude:-23.6525773, longitude:-46.7216739)
    ong3 = create(:ong, name: 'ong3', user: user, address: address3)

    address2 = create(:address, latitude:-23.6797034, longitude:-46.7129943)
    ong2 = create(:ong, name: 'ong2', user: user, address: address2)

    visit root_path

    sleep(2)

    within '#ongs' do
      expect(page.all(:xpath, '//div[@class="panel panel-default"]')[0]).to have_content('ong1')
      expect(page.all(:xpath, '//div[@class="panel panel-default"]')[1]).to have_content('ong2')
      expect(page.all(:xpath, '//div[@class="panel panel-default"]')[2]).to have_content('ong3')
    end
  end

  scenario 'should list the 3 oldets pets' do
    user = create(:user)
    address = create(:address, latitude:-23.6833585, longitude:-46.7144426)
    ong = create(:ong, user: user, address: address)
    pet1 = create(:pet, ong: ong, created_at: DateTime.new(2016, 1, 1, 0, 0, 0)
                                                           .in_time_zone)
    pet2 = create(:pet, ong: ong, created_at: DateTime.new(2016, 8, 1, 0, 0, 0)
                                                           .in_time_zone)
    pet3 = create(:pet, ong: ong, created_at: DateTime.new(2016, 5, 1, 0, 0, 0)
                                                           .in_time_zone)
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
    user = create(:user)
    user2 = create(:user)
    address = create(:address, latitude:-23.6833585, longitude:-46.7144426)
    ong = create(:ong, user: user, address: address)
    ong2 = create(:ong, user: user2, address: address)

    event1 = create(:event, ong: ong, datetime: DateTime.new(2015, 2, 7, 0,
                                                             0, 0).in_time_zone)
    event2 = create(:event, ong: ong2, datetime: DateTime.new(2016, 9, 8, 0, 0,
                                                              0).in_time_zone)
    event3 = create(:event, ong: ong, datetime: DateTime.new(2017, 11, 10, 0, 0,
                                                             0).in_time_zone)
    event4 = create(:event, ong: ong2, datetime: DateTime.new(2016, 5, 7, 0, 0,
                                                              0).in_time_zone)
    event5 = create(:event, ong: ong, datetime: DateTime.new(2017, 9, 3, 0, 0,
                                                             0).in_time_zone)
    event6 = create(:event, ong: ong2, datetime: DateTime.new(2017, 9, 12, 0, 0,
                                                              0).in_time_zone)
    event7 = create(:event, ong: ong2, datetime: DateTime.new(2018, 9, 12, 0, 0,
                                                              0).in_time_zone)

    visit root_path

    save_and_open_page

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
