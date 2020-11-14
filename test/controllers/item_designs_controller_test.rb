require 'test_helper'

class ItemDesignsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get item_designs_show_url
    assert_response :success
  end

  test "should get index" do
    get item_designs_index_url
    assert_response :success
  end

end
