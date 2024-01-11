class Product < ApplicationRecord
  belongs_to :company
  has_many :order_products
  has_many :orders, through: :order_products

  validates :name, presence: true
  validates :price, presence: true
    


  scope :list, ->(company_id) { where(company_id: company_id )}

end
