class CreateSchedules < ActiveRecord::Migration[5.2]
  def change
    create_table :schedules do |t|
      t.belongs_to :user, index: true
      t.integer :level
      t.timestamps
    end
  end
end
