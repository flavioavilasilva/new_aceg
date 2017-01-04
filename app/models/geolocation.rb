class Geolocation
  attr_reader :zipcode, :lat, :long, :address, :state, :city, :address_number

  def initialize(resource = {})
    @zipcode = resource[0].postal_code
    @lat = resource[0].latitude
    @long = resource[0].longitude
    @address = resource[0].route
    @state = resource[0].state
    @city = resource[0].city
    @address_number = nil
  end
end
