class ChangeBookYear < ActiveRecord::Migration[5.2]
  def change
   remove_column :books, :publishing_date
   add_column :books, :publishing_date, :integer
  end
end
