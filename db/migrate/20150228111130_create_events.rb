class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :service
      t.string :address
      t.string :event_url
      t.text :catch
      t.decimal :lon
      t.decimal :lat
      t.datetime :started_at
      t.datetime :ended_at
      t.string :place
      t.integer :limit
      t.integer :accepted
      t.integer :waiting

      t.timestamps null: false
    end
  end
end
