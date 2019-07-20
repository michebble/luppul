class AddCompletedAtToSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :completed_at, :timestamp
  end
end
