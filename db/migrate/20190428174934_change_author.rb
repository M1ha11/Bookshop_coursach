class ChangeAuthor < ActiveRecord::Migration[5.2]
  def change
    remove_column :authors, :firstname
    remove_column :authors, :lastname
    add_column :authors, :author, :string
  end
end
