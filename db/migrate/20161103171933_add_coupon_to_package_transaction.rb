class AddCouponToPackageTransaction < ActiveRecord::Migration[5.0]
  def change
    add_reference :package_transactions, :coupon, foreign_key: true
  end
end
