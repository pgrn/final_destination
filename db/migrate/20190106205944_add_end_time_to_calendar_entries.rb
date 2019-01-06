class AddEndTimeToCalendarEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :calendar_entries, :end_time, :datetime
  end
end
