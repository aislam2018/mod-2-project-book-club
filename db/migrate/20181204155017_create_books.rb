class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.string :authors
      t.integer :page_count
      t.string :description
      t.string :categories
      t.float :average_rating
      t.string :thumbnail

      t.timestamps
    end
  end
end
