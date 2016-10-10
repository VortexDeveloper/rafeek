class NoRequiredProfile < ActiveRecord::Migration[5.0]
  def change
      change_column :profiles, :city_id, :integer, null: true
      change_column :profiles, :state_id, :integer, null: true
      change_column :profiles, :country_id, :integer, null: true
  end
end
