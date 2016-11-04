class AddAasmStateToPackageTransactions < ActiveRecord::Migration
  def change
    add_column :package_transactions, :aasm_state, :string
  end
end
