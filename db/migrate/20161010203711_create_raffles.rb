class CreateRaffles < ActiveRecord::Migration[5.0]
  def change
    create_table :raffles do |t|
      t.string :title
      t.string :description
      t.integer :points
      t.integer :amount
      t.string :image
      t.string :string

      t.timestamps
    end
  end
end
