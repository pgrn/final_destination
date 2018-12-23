class AddCalendarEventTypeReferencesToCalendarEntries < ActiveRecord::Migration[5.2]
  def change
    add_reference :calendar_entries, :calendar_entry_type, foreign_key: true, null: false
  end
end
