class ChangeColumnLineItems < ActiveRecord::Migration[5.2]
  def change
    change_table :line_items do |t|
      change_column :line_items, :quantity, :integer, default: 1
    end
  end
end
