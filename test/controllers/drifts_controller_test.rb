require 'test_helper'

class DriftsControllerTest < ActionController::TestCase
  setup do
    @drift = drifts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drifts)
  end

  test "should create drift" do
    assert_difference('Drift.count') do
      post :create, drift: { latitude: @drift.latitude, longitude: @drift.longitude }
    end

    assert_response 201
  end

  test "should show drift" do
    get :show, id: @drift
    assert_response :success
  end

  test "should update drift" do
    put :update, id: @drift, drift: { latitude: @drift.latitude, longitude: @drift.longitude }
    assert_response 204
  end

  test "should destroy drift" do
    assert_difference('Drift.count', -1) do
      delete :destroy, id: @drift
    end

    assert_response 204
  end
end
