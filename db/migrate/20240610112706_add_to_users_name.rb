class AddToUsersName < ActiveRecord::Migration[7.0]
  def change
    change_table :users, bulk: true do |t|
      t.string :name, null: false
    end
  end
end
