class AddMessageTitleToContacts < ActiveRecord::Migration[5.0]
  def change
    add_column :contacts, :message_title, :string
  end
end
