class CreateRulesets < ActiveRecord::Migration[5.2]
  def change
    create_table :rulesets do |t|
      t.references :space, foreign_key: true, null: false
      t.text :name, null: false
      t.text :description

      t.timestamps
    end
  end
end
