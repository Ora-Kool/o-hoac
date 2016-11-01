class AddReadMessageToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :read_message, :boolean, default: false
  end
end
