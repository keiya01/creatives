require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get signin" do
    get users_signin_url
    assert_response :success
  end

end
