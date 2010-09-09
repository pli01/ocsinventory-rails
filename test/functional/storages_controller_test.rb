require 'test_helper'

class StoragesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:storages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create storages" do
    assert_difference('Storages.count') do
      post :create, :storages => { }
    end

    assert_redirected_to storages_path(assigns(:storages))
  end

  test "should show storages" do
    get :show, :id => storages(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => storages(:one).to_param
    assert_response :success
  end

  test "should update storages" do
    put :update, :id => storages(:one).to_param, :storages => { }
    assert_redirected_to storages_path(assigns(:storages))
  end

  test "should destroy storages" do
    assert_difference('Storages.count', -1) do
      delete :destroy, :id => storages(:one).to_param
    end

    assert_redirected_to storages_path
  end
end
