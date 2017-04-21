require 'test_helper'

class RecipesControllerTest < ActionDispatch::IntegrationTest
  test "Should show Index page" do
    get :index
    assert_response :success
  end
end
