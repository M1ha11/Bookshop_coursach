class RemoveFromBooks < ActiveRecord::Migration[5.2]
  def change
    remove_column :books, :author_id
    remove_column :books, :theme_id
    remove_column :books, :publisher_id
    remove_column :books, :publishing_date
  end
end
