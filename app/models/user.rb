class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, authentication_keys: [:username]

  validates :username, presence: :true, uniqueness: { case_sensitive: false }

  has_many :leaves

  scope :reporting_heads, -> { where(reporting_head: true) }

  # def email_required?
  #   false
  # end
  #
  # def email_changed?
  #   false
  # end

  def leaves_waiting_for_approval
    Leave.where(reporting_head_id: self.id, status: "Applied")
  end
end
