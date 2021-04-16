class GeocodeAddress
  def initialize(address_input)
    @address = address_input
  end

  def call
    Geokit::Geocoders::MapboxGeocoder.geocode(@address).ll.split(",").map(&:to_f) # returns [lat, lng] array of floats
  end
end
