class AddAttachmentAvatarToRaffles < ActiveRecord::Migration
  def self.up
    change_table :raffles do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :raffles, :avatar
  end
end
