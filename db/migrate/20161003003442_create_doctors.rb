class CreateDoctors < ActiveRecord::Migration[5.0]
  def change
    create_table :doctors do |t|
      t.string :doctors_name
      t.string :speciality
      t.text :professional_details
      t.string :work_experience

      t.timestamps
    end
  end
end
