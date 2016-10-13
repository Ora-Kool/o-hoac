class AddStatusToDoctors < ActiveRecord::Migration[5.0]
  def change
    add_column :doctors, :status, :boolean, default: true
  end
end
