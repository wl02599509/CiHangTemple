# frozen_string_literal: true

class DeviseCreateAdminMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_managers do |t|
      ## Database authenticatable
      t.string :id_card_number,     null: false
      t.string :email,              null: false
      t.string :name,               null: false
      t.string :address,            null: false
      t.datetime :birth_date,       null: false
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at


      t.timestamps null: false
    end

    add_index :admin_managers, :id_card_number,       unique: true
    add_index :admin_managers, :email, unique: true
    add_index :admin_managers, :reset_password_token, unique: true
    # add_index :admin_managers, :confirmation_token,   unique: true
    # add_index :admin_managers, :unlock_token,         unique: true
  end
end
