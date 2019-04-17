class CreatePublisher < ActiveRecord::Migration[5.2]
  def change
    create_table :publishers do |t|
      t.string :name
      t.integer :book_id
    end
  end
end
