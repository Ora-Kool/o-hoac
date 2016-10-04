class AddAppointmentTokenToAppointments < ActiveRecord::Migration[5.0]
  def change
    add_column :appointments, :appointment_token, :string
  end
end
