class AddReportingHeadToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :reporting_head, :boolean, default: false
  end
end
