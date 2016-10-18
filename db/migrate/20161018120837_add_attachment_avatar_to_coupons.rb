class AddAttachmentAvatarToCoupons < ActiveRecord::Migration
  def self.up
    change_table :coupons do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :coupons, :avatar
  end
end
