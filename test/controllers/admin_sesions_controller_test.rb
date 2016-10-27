require 'test_helper'

class AdminSesionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admin_sesions_new_url
    assert_response :success
  end

end
