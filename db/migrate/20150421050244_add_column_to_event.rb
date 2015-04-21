class AddColumnToEvent < ActiveRecord::Migration
  def change
    add_column :events, :owner_id, :int

    add_index :events, :owner_id
  end
end
