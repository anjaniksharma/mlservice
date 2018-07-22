require 'test_helper'

class MlModelControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get ml_model_new_url
    assert_response :success
  end

  test "should get show" do
    get ml_model_show_url
    assert_response :success
  end

end
