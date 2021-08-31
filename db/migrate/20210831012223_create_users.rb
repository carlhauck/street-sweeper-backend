class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :email
      t.string :address
      t.string :ward_section
      t.boolean :is_subscribed, default: true

      t.timestamps
    end
  end
end
