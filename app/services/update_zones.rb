class UpdateZones
  def initialize
    response = HTTP.get("https://data.cityofchicago.org/resource/u7w7-t89t.json")
    @data = JSON.parse(response.body)
  end

  def call
    non_contig = 0
    @data.each do |r|
      if r["the_geom"]["coordinates"].flatten(2).length > 1
        non_contig += 1
      end

      Zone.create!(
        {
          coordinates: r["the_geom"]["coordinates"].flatten(2),
          ward: r["ward"],
          section: r["section"],
          ward_section: r["code"],
        }
      )
    end
    puts "NON-CONTIG: #{non_contig}"
  end
end
