class AddAncestryToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :ancestry, :string
  end
end
