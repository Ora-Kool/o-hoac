class AddCityRefToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_reference :doctors, :city, foreign_key: true
  end
end
