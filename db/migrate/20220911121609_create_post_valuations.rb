class CreatePostValuations < ActiveRecord::Migration[6.1]
  def change
    create_table :post_valuations do |t|
      t.references :post, null: false, foreign_key: true
      t.integer :access_point, null: false
      t.integer :casually_point, null: false
      t.integer :price_point, null: false
      t.integer :go_to_again_point, null: false
      t.integer :one_person_point, null: false

      t.timestamps
    end
  end
end
