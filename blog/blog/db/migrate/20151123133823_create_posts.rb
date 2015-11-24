class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :text
      t.integer :state, default: 0
      t.timestamps null: false
    end
  end
end
