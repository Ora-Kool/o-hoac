class AddCurrentHospitalToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :current_hospital, :string
  end
end
