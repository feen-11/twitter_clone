# frozen_string_literal: true

class AddToUsersPhoneNumberAndBirthday < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :phone_number, null: false
      t.date :birthday, null: false
    end
  end
end
