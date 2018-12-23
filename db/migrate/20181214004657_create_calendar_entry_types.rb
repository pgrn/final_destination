class CreateCalendarEntryTypes < ActiveRecord::Migration[5.2]
  def change
    create_table :calendar_entry_types do |t|
      t.string :value

      t.timestamps
    end
  end
end
