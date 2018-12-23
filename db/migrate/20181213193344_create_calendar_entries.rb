class CreateCalendarEntries < ActiveRecord::Migration[5.2]
  def change
    create_table :calendar_entries do |t|
      t.text :name, null: false
      t.text :description
      t.text :location
      t.datetime :time, null: false
      t.references :owner, foreign_key: { to_table: :users }
      t.references :calendar, foreign_key: true, null: false

      t.timestamps
    end
  end
end