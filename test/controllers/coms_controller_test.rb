require 'test_helper'

class ComsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @com = coms(:one)
  end

  test "should get index" do
    get coms_url
    assert_response :success
  end

  test "should get new" do
    get new_com_url
    assert_response :success
  end

  test "should create com" do
    assert_difference('Com.count') do
      post coms_url, params: { com: { content: @com.content, post_id: @com.post_id, user_id: @com.user_id } }
    end

    assert_redirected_to com_url(Com.last)
  end

  test "should show com" do
    get com_url(@com)
    assert_response :success
  end

  test "should get edit" do
    get edit_com_url(@com)
    assert_response :success
  end

  test "should update com" do
    patch com_url(@com), params: { com: { content: @com.content, post_id: @com.post_id, user_id: @com.user_id } }
    assert_redirected_to com_url(@com)
  end

  test "should destroy com" do
    assert_difference('Com.count', -1) do
      delete com_url(@com)
    end

    assert_redirected_to coms_url
  end
end
