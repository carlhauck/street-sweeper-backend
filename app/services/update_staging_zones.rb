class UpdateStagingZones
  def initialize
    response = HTTP.get("https://data.cityofchicago.org/resource/u7w7-t89t.json")
    @data = JSON.parse(response.body)
  end

  def call
    @data.each do |r|
      StagingZone.create!(
        {
          coordinates: r["the_geom"]["coordinates"].flatten(2),
          ward: r["ward"],
          section: r["section"],
          ward_section: r["code"],
        }
      )
    end
  end
end
