class Changebookwithid < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :author
    remove_column :books, :publisher
    remove_column :books, :theme
    add_column :books, :author_id, :integer
    add_column :books, :publisher_id, :integer
    add_column :books, :theme_id, :integer
  end
end
