class CreateCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :calendars do |t|
      t.string :name, null: false
      t.text :description
      t.text :location
      t.string :calendar_type, null: false
      t.references :space, foreign_key: true, null: false

      t.timestamps
    end
  end
end
