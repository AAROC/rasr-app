require 'test_helper'

class ExperimentsControllerTest < ActionDispatch::IntegrationTest

  def sign_in(user)
    post user_session_path \
      "heiko@me.com"    => user.email,
      "hhdk#s0" => user.encrypted_password
  end

  setup do
    @experiment = experiments(:english_primary)
  end

  test "should get index" do
    get experiments_url
    assert_response :success
  end

  test "should get new" do

    get new_experiment_url
    assert_response 302
  end

  test "should create experiment" do
    assert_difference('Experiment.count') do
      post experiments_url, params: { experiment: { configuration: @experiment.configuration, language: @experiment.language, primary: @experiment.primary } }
    end

    assert_redirected_to experiment_url(Experiment.last)
  end

  test "should show experiment" do
    get experiment_url(@experiment)
    assert_response :success
  end

  test "should get edit" do
    get edit_experiment_url(@experiment)
    assert_response :success
  end

  test "should update experiment" do
    skip("No updates implemented yet")
    patch experiment_url(@experiment), params: { experiment: { configuration: @experiment.configuration, language: @experiment.language, primary: @experiment.primary } }
    assert_redirected_to experiment_url(@experiment)
  end

  test "should destroy experiment" do
    assert_difference('Experiment.count', -1) do
      delete experiment_url(@experiment)
    end

    assert_redirected_to experiments_url
  end
end
