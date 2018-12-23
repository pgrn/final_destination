class CreateCalendarEntryParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :calendar_entry_participations do |t|
      t.references :user, foreign_key: true, null: false
      t.references :calendar_entry, foreign_key: true, null: false

      t.timestamps
    end
  end
end
