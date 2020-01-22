class ChangeBoook < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :author_id
    remove_column :books, :publisher_id
    remove_column :books, :theme_id
    add_column :books, :author, :string
    add_column :books, :publisher, :string
    add_column :books, :theme, :string
  end
end
