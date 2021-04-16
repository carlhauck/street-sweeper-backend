class AddWardSectionMonthToStagingSchedule < ActiveRecord::Migration[6.0]
  def change
    add_column :staging_schedules, :ward_section_month, :integer
  end
end
