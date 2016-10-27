class Contact < ApplicationRecord
	validates :full_name, presence: true
	validates :email, presence: true
	validates :mobile, phone: { possible: true,
                                    allow_blank: false,
                                    types: [:voip, :mobile],
                                    #message: 'is invalid, just your number'
                                    },
                                    uniqueness: true,
                                    length: { maximum: 9 }

    validates :message, presence: true
end
