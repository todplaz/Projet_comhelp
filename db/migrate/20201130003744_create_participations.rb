class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.belongs_to :user
      t.belongs_to :post
      t.boolean :is_validated_by_creator

    
      t.timestamps
    end
  end
end
