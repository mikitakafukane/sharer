require 'test_helper'

class BelongingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get belongings_index_url
    assert_response :success
  end

end
