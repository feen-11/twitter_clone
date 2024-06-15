# frozen_string_literal: true

class AddToUsersUidAndProvider < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :uid
      t.string :provider, null: false, default: ''

      t.index %i[uid provider], unique: true
    end
  end
end
