require 'test_helper'

class Api::FavoritesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_favorites_index_url
    assert_response :success
  end

end
