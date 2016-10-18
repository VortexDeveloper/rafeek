class AddAttachmentAvatarToPartners < ActiveRecord::Migration
  def self.up
    change_table :partners do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :partners, :avatar
  end
end
