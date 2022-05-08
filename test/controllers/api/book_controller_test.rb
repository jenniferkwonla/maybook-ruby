require "test_helper"

class Api::BookControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get api_book_all_url
    assert_response :success
  end
end
