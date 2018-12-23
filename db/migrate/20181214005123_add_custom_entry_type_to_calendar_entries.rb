class AddCustomEntryTypeToCalendarEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :calendar_entries, :custom_entry_type, :string
  end
end
