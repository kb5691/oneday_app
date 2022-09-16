# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false

      ## Database authenticatable(ログイン用)
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      t.string :profile_image
      t.string :address
      t.string :go_to_area
      t.string :like_situation

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
  end
end
