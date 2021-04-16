class AddWardSectionMonthToSchedule < ActiveRecord::Migration[6.0]
  def change
    add_column :schedules, :ward_section_month, :integer
  end
end
