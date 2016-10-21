class AddTidAndCardNumberToPackageTransaction < ActiveRecord::Migration[5.0]
  def change
    add_column :package_transactions, :tid, :string
    add_column :package_transactions, :card_number, :string
  end
end
