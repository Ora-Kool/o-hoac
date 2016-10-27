class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :full_name
      t.string :email
      t.string :mobile
      t.text :message

      t.timestamps
    end
  end
end
