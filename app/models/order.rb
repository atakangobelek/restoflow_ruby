class Order < ApplicationRecord
  include AASM

  belongs_to :company
  belongs_to :user, optional: true

  validates :table, presence: true

  aasm :column => 'state' do
    state :taken, initial: true
  end

  scope :list, ->(company_id) { where(company_id: company_id )}

end
