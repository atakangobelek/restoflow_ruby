class Company < ApplicationRecord
  resourcify
  
  has_many :users
  has_many :orders
  has_many :products
  has_many :categories
end
