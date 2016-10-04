require 'test_helper'

class DoctorSessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get doctor_sessions_new_url
    assert_response :success
  end

end
