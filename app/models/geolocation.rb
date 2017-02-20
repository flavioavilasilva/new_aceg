class Geolocation
  attr_reader :postal_code, :latitude, :longitude, :address, :state, :city, :address_number

  def initialize(resource = {})
    @postal_code = resource[0].postal_code
    @latitude = resource[0].latitude
    @longitude = resource[0].longitude
    @address = resource[0].route
    @state = resource[0].state
    @city = resource[0].city
    @address_number = nil
  end
end
