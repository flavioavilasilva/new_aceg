class HomeController < ApplicationController
  LATITUDE_DEFAULT = -23.550756.freeze
  LONGITUDE_DEFAULT = -46.632970.freeze
  def index
    addresses = Address.near("#{latitude}, #{longitude}", 30)
    @ongs = []
    addresses.map do |address|
      @ongs << address.ong if address.ong.present?
    end

    @events = Event.home_events
  end

  private

  def latitude
    session[:geolocation].blank? || Rails.env.test? ? LATITUDE_DEFAULT : session[:geolocation]['latitude']
  end

  def longitude
    session[:geolocation].blank? || Rails.env.test? ? LONGITUDE_DEFAULT : session[:geolocation]['longitude']
  end
end
