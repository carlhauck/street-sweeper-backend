class UpdateZones
  def initialize
    response = HTTP.get("https://data.cityofchicago.org/resource/u7w7-t89t.json")
    @data = JSON.parse(response.body)
  end

  def call
    @data.each do |r|
      Zone.create!(
        {
          coordinates: r["the_geom"]["coordinates"],
          ward: r["ward"],
          section: r["section"],
          ward_section: r["code"],
        }
      )
    end
  end
end
