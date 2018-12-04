class CreateGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :groups do |t|
      t.string :name
      t.integer :book_id
      t.integer :creator_id
      t.datetime :first_meeting
      t.integer :days
      t.integer :reading_amount

      t.timestamps
    end
  end
end
