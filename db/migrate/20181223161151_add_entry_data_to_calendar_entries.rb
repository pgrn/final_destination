class AddEntryDataToCalendarEntries < ActiveRecord::Migration[5.2]
  def change
    add_column :calendar_entries, :entry_data, :jsonb, null: false, default: '{}'
    add_index :calendar_entries, :entry_data, using: :gin
  end
end
