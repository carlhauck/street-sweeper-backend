class Schedule < ApplicationRecord
  belongs_to :zone, class_name: "Zone", foreign_key: :ward_section, primary_key: :ward_section, optional: true
end
