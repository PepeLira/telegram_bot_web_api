require "test_helper"

class LeaderBoardControllerTest < ActionDispatch::IntegrationTest
  test "should get global" do
    get leader_board_global_url
    assert_response :success
  end

  test "should get index" do
    get leader_board_index_url
    assert_response :success
  end

  test "should get chat" do
    get leader_board_chat_url
    assert_response :success
  end
end
