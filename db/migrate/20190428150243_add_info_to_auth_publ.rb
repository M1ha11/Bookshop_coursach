class AddInfoToAuthPubl < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :info, :text
    add_column :publishers, :info, :text
  end
end
