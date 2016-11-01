class Contact < ApplicationRecord
    attr_accessor :read_mail
	validates :full_name, presence: true
	validates :email, presence: true
	validates :mobile, phone: { possible: true,
                                    allow_blank: false,
                                    types: [:voip, :mobile],
                                    #message: 'is invalid, just your number'
                                    },
                                    uniqueness: false,
                                    length: { maximum: 9 }

    validates :message_title, presence: true

    validates :message, presence: true


    def seen
        update_attribute(:read_message, true)
    end

end
