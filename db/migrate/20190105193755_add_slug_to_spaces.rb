class AddSlugToSpaces < ActiveRecord::Migration[5.2]
  def change
    add_column :spaces, :slug, :string
    add_index :spaces, :slug, unique: true
  end
end
