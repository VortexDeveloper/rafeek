class AddDeadlineToRaffle < ActiveRecord::Migration[5.0]
  def change
    add_column :raffles, :deadline, :date
  end
end
