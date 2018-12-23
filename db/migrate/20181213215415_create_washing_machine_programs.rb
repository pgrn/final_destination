class CreateWashingMachinePrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :washing_machine_programs do |t|
      t.string :name, null: false
      t.references :space, foreign_key: true
      t.integer :temp, null: false
      t.string :temp_unit, null: false
      t.integer :speed, null: false
      t.text :description

      t.timestamps
    end
  end
end
