class RemoveImageFromPartner < ActiveRecord::Migration[5.0]
  def change
    remove_column :partners, :logo
  end
end
