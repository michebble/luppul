class ChangeStartDateOnSessions < ActiveRecord::Migration[5.2]
  def change
    change_column_null :sessions, :start_date, false
  end
end
