class CreateSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :spaces do |t|
      t.string :name, null: false
      t.text :description
      t.text :location

      t.timestamps
    end
  end
end
