class StagingZone < ApplicationRecord
  validates_presence_of :coordinates, :ward_section
end
