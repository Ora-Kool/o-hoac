class Gender < ApplicationRecord
  has_many :users
  has_many :doctors
end
