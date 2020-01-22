class AddToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :author, :string
    add_column :books, :publisher, :string
    add_column :books, :theme, :string
    add_column :books, :publishing_date, :date
  end
end
