require 'test_helper'

class Api::TeamsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_teams_index_url
    assert_response :success
  end

end
