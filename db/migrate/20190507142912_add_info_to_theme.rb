class AddInfoToTheme < ActiveRecord::Migration[5.2]
  def change
    add_column :themes, :info, :text
  end
end
