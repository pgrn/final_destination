class AddAllDayToCalendarEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :calendar_entries, :all_day, :boolean, null: false, default: false
  end
end
