class RemoveColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :authors, :book_id
    remove_column :themes, :book_id
    remove_column :publishers, :book_id
  end
end
