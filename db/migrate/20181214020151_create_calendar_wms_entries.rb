class CreateCalendarWmsEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :calendar_wms_entries do |t|
      t.references :calendar_entry, foreign_key: true, null: false
      t.references :washing_machine_program, foreign_key: true, null: false
      t.integer :fullness, null: false
      t.string :content, null: false
      t.string :extra_info

      t.timestamps
    end
  end
end
