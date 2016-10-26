class User < ApplicationRecord
  attr_accessor :remember_token
  has_many :doctors
  has_many :appointments, dependent: :destroy
  belongs_to :gender
  belongs_to :city
  before_save { self.email = email.downcase }
  validates :mobile_phone, phone: { possible: true,
                                    allow_blank: false,
                                    types: [:voip, :mobile],
                                    #message: 'is invalid, just your number'
                                    },
                                    uniqueness: true,
                                    length: { maximum: 9 }
                                    
  validates :name, presence: true, length: { maximum: 50 }



  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  has_attached_file :profile_photo, styles: {large: "600x600", medium: "300x300>", thumnail: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :profile_photo, content_type: /\Aimage\/.*\z/

  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #this method returns a random user token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #this instance method helps to remember a user in the database
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
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
