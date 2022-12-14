# frozen_string_literal: true

class AddDeviseToDoctors < ActiveRecord::Migration[6.0]
  def self.up
    change_table :doctors do |t|
      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at
    end

    add_index :doctors, :reset_password_token, unique: true
  end
end
