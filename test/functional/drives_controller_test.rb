require 'test_helper'

class DrivesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:drives)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create drives" do
    assert_difference('Drives.count') do
      post :create, :drives => { }
    end

    assert_redirected_to drives_path(assigns(:drives))
  end

  test "should show drives" do
    get :show, :id => drives(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => drives(:one).to_param
    assert_response :success
  end

  test "should update drives" do
    put :update, :id => drives(:one).to_param, :drives => { }
    assert_redirected_to drives_path(assigns(:drives))
  end

  test "should destroy drives" do
    assert_difference('Drives.count', -1) do
      delete :destroy, :id => drives(:one).to_param
    end

    assert_redirected_to drives_path
  end
end
