class CreateTickets < ActiveRecord::Migration
  def change
    create_table :tickets do |t|
      t.references :user, index: true
      t.references :event, index: true
      t.string :comment
      t.timestamps null: false
    end
    add_foreign_key :tickets, :users
    add_foreign_key :tickets, :events

    add_index :tickets, [:user_id, :event_id], unique: true
    add_index :tickets, [:event_id, :user_id], unique: true
  end
end
