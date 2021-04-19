class StagingSchedule < ApplicationRecord
  validates_presence_of :ward_section, :ward, :section, :month_number, :dates, :ward_section_month
end
