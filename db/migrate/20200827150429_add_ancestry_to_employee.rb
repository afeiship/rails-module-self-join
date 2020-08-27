class AddAncestryToEmployee < ActiveRecord::Migration[6.0]
  def change
    add_column :employees, :ancestry, :string
    add_index :employees, :ancestry
  end
end
