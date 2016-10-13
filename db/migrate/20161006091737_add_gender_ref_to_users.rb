class AddGenderRefToUsers < ActiveRecord::Migration[5.0]
  def change
    add_reference :users, :gender, foreign_key: true
  end
end
