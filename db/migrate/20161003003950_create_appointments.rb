class CreateAppointments < ActiveRecord::Migration[5.0]
  def change
    create_table :appointments do |t|
      t.text :reason
      t.date :apt_date
      t.string :apt_time

      t.timestamps
    end
  end
end
