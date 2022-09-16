class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title, null: false
      t.text :recommend_point, null: false
      t.string :situation
      t.string :area
      t.string :recommend_image

      t.timestamps
    end
  end
end
