class CreateLineItems < ActiveRecord::Migration[5.2]
  def change
    create_table :line_items do |t|
      t.integer :cart_id
      t.integer :book_id
      t.integer :quantity

      t.timestamps
    end
  end
end
