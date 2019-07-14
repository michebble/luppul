class AddExerciseAndSetsToSessions < ActiveRecord::Migration[5.2]
  def change
    add_column :sessions, :exercise, :integer, null: false
    add_column :sessions, :sets, :integer, array: true, default: [], null: false
  end
end
