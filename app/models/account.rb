class Account < ApplicationRecord
  include AASM

  belongs_to :order
  has_one :order_product


  aasm :column => 'state' do
    state :requested, initial: true
    state :paid

    event :pay do
      transitions from: :requested, to: :paid
    end

  end

end
