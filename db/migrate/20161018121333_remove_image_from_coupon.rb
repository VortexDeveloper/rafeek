class RemoveImageFromCoupon < ActiveRecord::Migration[5.0]
  def change
    remove_column :coupons, :logo
  end
end
