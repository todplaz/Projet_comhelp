class FixColumnName < ActiveRecord::Migration[5.2]
  def change
		rename_column :posts, :is_validates, :is_validated
  end
end
