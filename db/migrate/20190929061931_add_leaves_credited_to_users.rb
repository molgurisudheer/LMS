class AddLeavesCreditedToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :leaves_credited, :integer, default: 10
  end
end
