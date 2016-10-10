require 'rails_helper'

feature 'User visits home' do
  scenario 'and user is logged in' do
    login
    expect(page).to have_content 'Cadastre sua ONG'
  end

  scenario 'and see 3 ongs' do
    user = create(:user)
    ongs = create_list(:ong, 6, user: user)

    ongs.each do |ong|
      create_list(:pet, 10, ong: ong)
    end
    visit root_path

    within '#ongs' do
      ongs[0..2].each do |ong|
        expect(page).to have_content(ong.name)
      end
    end
  end

  scenario 'should list the 3 oldets pets' do
    user = create(:user)
    ong = create(:ong, user: user)
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
    ong = create(:ong, user: user)
    ong2 = create(:ong, user: user2)

    event1 = create(:event, ong: ong, datetime: DateTime.new(2015, 2, 7, 0,
                                                             0, 0).in_time_zone)
    event2 = create(:event, ong: ong2, datetime: DateTime.new(2016, 9, 8, 0, 0,
                                                              0).in_time_zone)
    event3 = create(:event, ong: ong, datetime: DateTime.new(2016, 11, 10, 0, 0,
                                                             0).in_time_zone)
    event4 = create(:event, ong: ong2, datetime: DateTime.new(2016, 5, 7, 0, 0,
                                                              0).in_time_zone)
    event5 = create(:event, ong: ong, datetime: DateTime.new(2017, 1, 3, 0, 0,
                                                             0).in_time_zone)
    event6 = create(:event, ong: ong2, datetime: DateTime.new(2017, 9, 12, 0, 0,
                                                              0).in_time_zone)
    event7 = create(:event, ong: ong2, datetime: DateTime.new(2018, 9, 12, 0, 0,
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
