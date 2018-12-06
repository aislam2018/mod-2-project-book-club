class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :user_name
      t.string :password_digest
      t.string :user_img_url

      t.timestamps
    end
  end
end
