class AddCategoryToRaffles < ActiveRecord::Migration[5.0]
  def change
    add_column :raffles, :category, :string
  end
end
