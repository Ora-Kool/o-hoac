class AddApptTimeToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :appt_time, :string
  end
end
