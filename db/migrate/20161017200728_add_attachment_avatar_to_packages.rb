class AddAttachmentAvatarToPackages < ActiveRecord::Migration
  def self.up
    change_table :packages do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :packages, :avatar
  end
end
