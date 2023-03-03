require "test_helper"

class SectorsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get sectors_index_url
    assert_response :success
  end

  test "should get show" do
    get sectors_show_url
    assert_response :success
  end
end
