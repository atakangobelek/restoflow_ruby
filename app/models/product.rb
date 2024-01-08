class Product < ApplicationRecord
    belongs_to :company

    validates :name, presence: true
    validates :price, presence: true
    


    scope :list, ->(company_id) { where(company_id: company_id )}

end
