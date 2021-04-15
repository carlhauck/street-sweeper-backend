class UpdateSchedules
  def initialize
    schedules = []
    offset = 0
    while true
      response = JSON.parse(HTTP.get("https://data.cityofchicago.org/resource/wvjp-8m67.json?$offset=#{offset}").body)
      schedules = schedules.concat(response)
      break if response.length < 1000
      offset += 1000
    end
    @data = schedules
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
