class ChangeDecimalFieldInZoneTable < ActiveRecord::Migration[6.0]
  def self.up
    change_column :zones, :coordinates, :decimal, precision: 19, scale: 14, array: true, default: []
  end
end
