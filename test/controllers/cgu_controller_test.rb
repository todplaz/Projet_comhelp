require 'test_helper'

class CguControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get cgu_index_url
    assert_response :success
  end

end
