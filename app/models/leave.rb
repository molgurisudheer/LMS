class Leave < ApplicationRecord
  belongs_to :user
  belongs_to :reporting_head, class_name: "User"

  before_create :add_new_leave_status

  def add_new_leave_status
    self.status = "Applied"
  end
end
