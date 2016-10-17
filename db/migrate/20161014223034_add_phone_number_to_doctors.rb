class AddPhoneNumberToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :phone_number, :string
  end
end
