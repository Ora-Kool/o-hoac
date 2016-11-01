class Department < ApplicationRecord
  has_many :doctors

  validates :department_name, presence: true
end
