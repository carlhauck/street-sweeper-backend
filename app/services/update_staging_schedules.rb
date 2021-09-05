class UpdateStagingSchedules
  def initialize
    schedules = []
    offset = 0
    while true
      response = JSON.parse(HTTP.get("https://data.cityofchicago.org/resource/wvjp-8m67.json?$$app_token=#{Rails.application.credentials.socrata[:app_token]}&$offset=#{offset}").body)
      schedules = schedules.concat(response)
      break if response.length < 1000
      offset += 1000
    end
    @data = schedules
  end

  def delete_sql
    "DELETE FROM staging_schedules;"
  end

  def call
    ActiveRecord::Base.connection.exec_query(delete_sql)
    @data.each do |r|
      ward_section_month = (r["ward_section_concatenated"].to_s + r["month_number"].to_s).to_i
      StagingSchedule.create(
        {
          ward_section_month: ward_section_month,
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
