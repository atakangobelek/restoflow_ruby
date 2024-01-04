class Company < ApplicationRecord
  resourcify
  
  has_many :users
  has_many :orders
end
