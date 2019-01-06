class RemoveTimeFromCalendarEntries < ActiveRecord::Migration[5.2]
  def change
    remove_column :calendar_entries, :time, :datetime
  end
end
