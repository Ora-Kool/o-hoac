class AddWorkingHoursToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :working_hours, :string
  end
end
