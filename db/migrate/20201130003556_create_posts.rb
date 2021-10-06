class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.date :datetime
      t.string :state
    

      t.belongs_to :city
      t.belongs_to :user
      t.belongs_to :category
      t.boolean :is_validates


      t.timestamps
    end
  end
end
