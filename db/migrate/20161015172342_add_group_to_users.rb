class AddGroupToUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :group, :integer, comment: "For now, 0 - admin, 1 - common user"
  end
end
