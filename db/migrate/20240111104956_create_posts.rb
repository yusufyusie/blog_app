class CreatePosts < ActiveRecord::Migration[7.1]
  def change
    create_table :posts do |t|
      t.text :title
      t.text  :text
      t.integer :comment_counter
      t.integer :likes_counter

      t.timestamps
    end
  end
end
