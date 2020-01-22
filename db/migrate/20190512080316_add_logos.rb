class AddLogos < ActiveRecord::Migration[5.2]
  def change
    add_column :authors, :image, :string
    add_column :publishers, :logo, :string
    add_column :themes, :logo, :string
    add_column :books, :logo, :string
    add_column :books, :images, :string, array: true
  end
end
