class AddCategoryReferenceToRaffle < ActiveRecord::Migration[5.0]
  def change
    remove_column :raffles, :category
    add_reference :raffles, :category, foreign_key: true, null: true
  end
end
