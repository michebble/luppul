class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.date :start_date
      t.belongs_to :schedule, foreign_key: true

      t.timestamps
    end
  end
end
