class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.string :sub_title
      t.datetime :published_at
      t.integer :order, default: 1
      t.integer :user_id

      t.timestamps
    end
    add_index :posts, :title
  end
end
