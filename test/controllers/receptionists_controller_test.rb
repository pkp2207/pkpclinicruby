require "test_helper"

class ReceptionistsControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get receptionists_dashboard_url
    assert_response :success
  end
end
