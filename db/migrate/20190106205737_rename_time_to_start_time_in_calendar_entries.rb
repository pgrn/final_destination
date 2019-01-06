class RenameTimeToStartTimeInCalendarEntries < ActiveRecord::Migration[5.2]
  def change
    rename_column :calendar_entries, :time, :start_time
    change_column :calendar_entries, :start_time, :datetime, null: false
  end
end
