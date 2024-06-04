# frozen_string_literal: true

class AddToUsersPhoneNumberAndBirthday < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :phone_number, null: false, default: '未設定'
      t.date :birthday, null: false, default: '1900-01-01'
    end
  end
end
