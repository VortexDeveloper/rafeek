class RemoveUserFromTicket < ActiveRecord::Migration[5.0]
  def change
    remove_reference :tickets, :user, foreign_key: true
    add_reference :tickets, :owner, references: :user, index: true
    add_foreign_key :tickets, :users, column: :owner_id
  end
end
