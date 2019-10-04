class AddLeaveCreditedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :leave_credited, :integer, default: 10
  end
end
