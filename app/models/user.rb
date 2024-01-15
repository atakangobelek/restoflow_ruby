class User < ApplicationRecord
  rolify
  belongs_to :company
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
          :rememberable, :validatable, stretches: 13

  after_create :assign_default_role

  enum role: [:admin, :waiter, :kitchen, :till]
  after_initialize :set_default_role, if: :new_record?

  def set_default_role
    self.role ||= :user
  end

  def assign_default_role
    self.add_role(:admin, self.company) if self.roles.blank?
  end
end
