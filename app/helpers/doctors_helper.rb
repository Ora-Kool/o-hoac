module DoctorsHelper
  def checked(area)
    @doctor.working_hours.nil? ? false : @doctor.working_hours.match(area)
  end

end
