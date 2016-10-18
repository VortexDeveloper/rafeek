class RemoveImageFromRaffle < ActiveRecord::Migration[5.0]
  def change
    remove_column :raffles, :image
  end
end
