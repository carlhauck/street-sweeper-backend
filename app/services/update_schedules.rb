class UpdateSchedules
  def initialize
    response = HTTP.get("https://data.cityofchicago.org/resource/wvjp-8m67.json")
    @data = JSON.parse(response.body)
  end

  def call
    @data.each do |r|
      Schedule.create!(
        {
          ward_section: r["ward_section_concatenated"],
          ward: r["ward"],
          section: r["section"],
          month_number: r["month_number"],
          dates: r["dates"],
        }
      )
    end
  end
end
