class Order < ApplicationRecord
  include AASM

  belongs_to :company
  belongs_to :user, optional: true
  has_many :order_products
  has_many :products, through: :order_products
  accepts_nested_attributes_for :order_products, reject_if: :all_blank, allow_destroy: true

  validates :table, presence: true

  aasm :column => 'state' do
    state :taken, initial: true
  end

  scope :list, ->(company_id) { where(company_id: company_id )} 

end
