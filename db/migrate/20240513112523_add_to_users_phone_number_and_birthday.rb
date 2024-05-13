class AddToUsersPhoneNumberAndBirthday < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :phone_number, :string, null: false
    add_column :users, :birthday, :date, null: false
  end
end
