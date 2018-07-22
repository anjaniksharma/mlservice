require 'test_helper'

class ClassifyResultsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get classify_results_index_url
    assert_response :success
  end

end
