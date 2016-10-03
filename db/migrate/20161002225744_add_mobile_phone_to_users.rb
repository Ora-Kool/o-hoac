class AddMobilePhoneToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :mobile_phone, :string, limit: 50
  end
end
