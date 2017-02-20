class LocationController < ApplicationController
  def create
    session[:geolocation] = Geolocation.new(Geocoder.search("#{params[:lat]}, #{params[:long]}"))
  end
end
