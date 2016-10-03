class Doctor < ApplicationRecord
  has_many :users
  belongs_to :department
  has_many :appointments
end
