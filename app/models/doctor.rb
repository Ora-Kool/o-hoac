class Doctor < ApplicationRecord
  has_many :users
  belongs_to :department
  has_many :appointments
  belongs_to :city
  belongs_to :gender

  attr_accessor :remember_token
  before_save { self.doctors_name = doctors_name.downcase }
  before_save do
    self.working_hours.gsub!(/[\[\]\"]/, " ") if attribute_present?("working_hours")
  end

  validates :phone_number, phone: { possible: true,
                                    allow_blank: false,
                                    types: [:voip, :mobile],
                                    message: 'is invalid, just your number'
  },
            uniqueness: true


  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  validates :doctors_name, presence: true

  has_attached_file :profile_photo, styles: {large: "600x600", medium: "300x300>", thumnail: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :profile_photo, content_type: /\Aimage\/.*\z/



  # Returns the hash digest of the given string.
  def Doctor.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
        BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #this method returns a random user token
  def Doctor.new_token
    SecureRandom.urlsafe_base64
  end

  #this instance method helps to remember a user in the database
  def remember
    self.remember_token = Doctor.new_token
    update_attribute(:remember_digest, Doctor.digest(remember_token))
  end

  #check if a given token matches that stored one and return true else false
  def authenticated?(remmber_token)
    BCrypt::Password.new(remember_digest).is_password?(remmber_token)
  end

  #forget a user when logged out
  def forget
    update_attribute(:remember_digest, nil)
  end
end
