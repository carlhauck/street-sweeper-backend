class Zone < ApplicationRecord
  has_many: schedules, class: "Schedule", foreign_key: :ward_section, primary_key: :ward_section
end
