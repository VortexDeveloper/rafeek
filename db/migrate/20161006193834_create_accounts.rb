class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.references :user, foreign_key: true
      t.integer :balance

      t.timestamps
    end
  end
end
