class Schedule < ApplicationRecord
  belongs_to: zone, class: "Zone", foreign_key: :ward_section, primary_key: :ward_section
end
