class AddWorkingDaysToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :working_days, :string
  end
end
