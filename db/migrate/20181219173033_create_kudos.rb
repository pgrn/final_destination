class CreateKudos < ActiveRecord::Migration[5.2]
  def change
    create_table :kudos do |t|
      t.string :name, null: false
      t.text :description
      t.integer :value, null: false
      t.references :kudoer, null: false, foreign_key: { to_table: :users }
      t.references :kudoee, null: false, foreign_key: { to_table: :users }
      t.references :space, foreign_key: true, null: false
      t.datetime :time, null: false

      t.timestamps
    end
  end
end
