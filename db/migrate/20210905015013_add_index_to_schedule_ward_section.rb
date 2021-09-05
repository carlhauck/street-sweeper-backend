class AddIndexToScheduleWardSection < ActiveRecord::Migration[6.0]
  def change
    add_index :schedules, :ward_section
  end
end
