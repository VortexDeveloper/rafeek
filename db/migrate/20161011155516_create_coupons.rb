class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.string :logo
      t.string :name
      t.string :code
      t.date :validity
      t.integer :discount

      t.timestamps
    end
  end
end
