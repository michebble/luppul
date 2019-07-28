class AddExerciseToSchedules < ActiveRecord::Migration[5.2]
  def change
    add_column :schedules, :exercise, :integer, null: false
  end
end
