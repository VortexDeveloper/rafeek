class RemoveImageFromPackage < ActiveRecord::Migration[5.0]
  def change
    remove_column :packages, :image
  end
end
