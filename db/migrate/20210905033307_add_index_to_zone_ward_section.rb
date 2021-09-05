class AddIndexToZoneWardSection < ActiveRecord::Migration[6.0]
  def change
    add_index :zones, :ward_section
  end
end
