# frozen_string_literal: true

class AddToUsersBiographyAndWebsiteAndLocation < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :biography, null: false, default: ''
      t.string :website, null: false, default: ''
      t.string :location, null: false, default: ''
    end
  end
end
