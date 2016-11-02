require 'test_helper'

class RasrControllerTest < ActionDispatch::IntegrationTest
  test "should get start" do
    get rasr_start_url
    assert_response :success
  end

end
