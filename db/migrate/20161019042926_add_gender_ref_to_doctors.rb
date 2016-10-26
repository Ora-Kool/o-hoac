class AddGenderRefToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_reference :doctors, :gender, foreign_key: true
  end
end
