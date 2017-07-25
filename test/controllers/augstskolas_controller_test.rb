require 'test_helper'

class AugstskolasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get augstskolas_index_url
    assert_response :success
  end

  test "should get new" do
    get augstskolas_new_url
    assert_response :success
  end

  test "should get show" do
    get augstskolas_show_url
    assert_response :success
  end

  test "should get edit" do
    get augstskolas_edit_url
    assert_response :success
  end

end
