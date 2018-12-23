class CreateRules < ActiveRecord::Migration[5.2]
  def change
    create_table :rules do |t|
      t.text :name, null: false
      t.text :description
      t.references :ruleset, foreign_key: true, null: false

      t.timestamps
    end
  end
end
