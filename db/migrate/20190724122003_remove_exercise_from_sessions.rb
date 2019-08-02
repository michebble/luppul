class RemoveExerciseFromSessions < ActiveRecord::Migration[5.2]
  def change
    remove_column :sessions, :exercise, :integer
  end
end
