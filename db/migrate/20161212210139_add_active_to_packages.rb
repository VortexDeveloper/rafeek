class AddActiveToPackages < ActiveRecord::Migration[5.0]
  def change
    add_column :packages, :active, :integer, default: 1
  end
end
