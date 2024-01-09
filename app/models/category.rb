class Category < ApplicationRecord
    has_many :products

    belongs_to :company

    validates :name, presence: true

    scope :list, ->(company_id) {where( company_id: company_id )}
end
