class LocationController < ActionController::Base
  def create
    @geolocation ||= Geolocation.new(Geocoder.search("#{params[:lat]}, #{params[:long]}"))
  end
end
