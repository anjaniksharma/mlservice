require 'test_helper'

class FilejobsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get filejobs_new_url
    assert_response :success
  end

  test "should get create" do
    get filejobs_create_url
    assert_response :success
  end

end
