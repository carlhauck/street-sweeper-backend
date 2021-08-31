class CreateEmailLogs < ActiveRecord::Migration[6.0]
  def change
    create_table :email_logs do |t|
      t.integer :user_id
      t.datetime :sent_at

      t.timestamps
    end
  end
end
