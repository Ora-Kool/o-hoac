class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  validates :reason, presence: true,  length: {maximum: 150 }
  validates :appt_time, presence: true
  validate :check_date


  private
  def check_date
    selected_date = apt_date
    if selected_date.blank? && selected_date.nil?
      errors.add(:apt_date, 'cannot be blank')
    elsif selected_date < Date.today
      errors.add(:apt_date, 'is invalid')
    else
      self.apt_date = selected_date
    end
  end


end
