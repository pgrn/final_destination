class AddSpaceShortNameToSpaces < ActiveRecord::Migration[5.2]
  def change
    add_column :spaces, :short_name, :string, null: false
    add_index :spaces, :short_name, unique: true
  end
end
