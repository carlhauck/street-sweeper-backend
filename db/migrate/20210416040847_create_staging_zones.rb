class CreateStagingZones < ActiveRecord::Migration[6.0]
  def change
    create_table :staging_zones do |t|
      t.decimal :coordinates, precision: 19, scale: 14, array: true, default: []
      t.string :ward
      t.string :section
      t.string :ward_section

      t.timestamps
    end
  end
end
