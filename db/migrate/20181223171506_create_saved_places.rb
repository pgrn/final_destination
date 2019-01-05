class CreateSavedPlaces < ActiveRecord::Migration[5.2]
  def change
    create_table :saved_places do |t|
      t.text :name, null: false
      t.text :description, null: false
      t.references :owner, null: false, foreign_key: { to_table: :users }
      t.references :space, foreign_key: true, null: false
      t.text :address
      t.text :website
      t.string :phone

      t.timestamps
    end
  end
end
