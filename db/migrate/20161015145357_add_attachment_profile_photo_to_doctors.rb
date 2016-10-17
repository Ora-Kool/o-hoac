class AddAttachmentProfilePhotoToDoctors < ActiveRecord::Migration
  def self.up
    change_table :doctors do |t|
      t.attachment :profile_photo
    end
  end

  def self.down
    remove_attachment :doctors, :profile_photo
  end
end
