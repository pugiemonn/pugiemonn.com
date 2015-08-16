class RenameLimitToEvent < ActiveRecord::Migration
  def change
    rename_column :events, :limit, :tickets_limit
  end
end
