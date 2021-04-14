class CreateSchedules < ActiveRecord::Migration[6.0]
  def change
    create_table :schedules do |t|
      t.string :ward_section
      t.string :ward
      t.string :section
      t.string :month_number
      t.string :dates

      t.timestamps
    end
  end
end
