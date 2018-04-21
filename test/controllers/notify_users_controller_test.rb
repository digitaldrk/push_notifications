require 'test_helper'

class NotifyUsersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get notify_users_create_url
    assert_response :success
  end

end
