class RemAddAuth < ActiveRecord::Migration[5.2]
  def change
    remove_column :authors, :fullname
    add_column :authors, :fulname, :string
  end
end
