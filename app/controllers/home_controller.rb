class HomeController < ApplicationController
  LATITUDE_DEFAULT = -23.550756.freeze
  LONGITUDE_DEFAULT = -46.632970.freeze
  def index
    addresses = Address.near("#{latitude}, #{longitude}", 10000)
    @ongs = []
    addresses.map do |address|
      @ongs << address.ong if address.ong.present?
    end

    @events = Event.where('datetime > :date', date: DateTime.now.in_time_zone)
                   .order(:datetime).limit(3)
    @cities = Ong.distinct.pluck(:city)
  end

  private

  def latitude
    session[:geolocation].blank? ? LATITUDE_DEFAULT : session[:geolocation]['latitude']
  end

  def longitude
    session[:geolocation].blank? ? LONGITUDE_DEFAULT : session[:geolocation]['longitude']
  end
end
