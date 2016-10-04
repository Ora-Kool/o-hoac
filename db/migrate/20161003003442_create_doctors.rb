class CreateDoctors < ActiveRecord::Migration[5.0]
  def change
    create_table :doctors do |t|
      t.string :doctors_name
      t.string :speciality, default: "default"
      t.text :professional_details, default: "default"
      t.string :work_experience, default: "0"

      t.timestamps
    end
  end
end
