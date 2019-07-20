class AddCompletedAtToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :completed_at, :timestamp
  end
end
