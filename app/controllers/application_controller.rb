class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  include DoctorSessionsHelper
  include AdminSessionsHelper
end
