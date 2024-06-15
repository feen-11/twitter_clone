# frozen_string_literal: true

class ChangeUsersNullTrueBirthdayAndPhoneNumber < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :phone_number, true
    change_column_null :users, :birthday, true
  end
end
