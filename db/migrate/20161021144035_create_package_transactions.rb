class CreatePackageTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :package_transactions do |t|
      t.integer :amount
      t.references :user, foreign_key: true
      t.integer :status
      t.references :package, foreign_key: true

      t.timestamps
    end
  end
end
