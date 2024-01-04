class Company < ApplicationRecord
  resourcify
  has_many :users
end
