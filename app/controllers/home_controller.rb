class HomeController < ApplicationController
  def index
    @ongs = Ong.limit(3)
    @pets = Pet.order(:created_at).limit(3)
    @events = Event.where('datetime > :date', date: DateTime.now.in_time_zone)
                   .order(:datetime).limit(3)
    @cities = Ong.distinct.pluck(:city)
  end
end
