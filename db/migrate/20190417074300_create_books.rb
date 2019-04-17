class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :name
      t.integer :author_id
      t.integer :publisher_id
      t.integer :theme_id
      t.date :publishing_date
      t.integer :pages
      t.string :cover
      t.string :isbn
      t.string :age
      t.text :description
      t.float :price
    end
  end
end
