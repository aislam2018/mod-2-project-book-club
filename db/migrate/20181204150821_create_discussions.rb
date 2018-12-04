class CreateDiscussions < ActiveRecord::Migration[5.2]
  def change
    create_table :discussions do |t|
      t.integer :group_id

      t.timestamps
    end
  end
end
