class CreateZones < ActiveRecord::Migration[6.0]
  def change
    create_table :zones do |t|
      t.decimal :coordinates, precision: 15, scale: 10, array: true, default: []
      t.string :ward
      t.string :section
      t.string :ward_section

      t.timestamps
    end
  end
end
