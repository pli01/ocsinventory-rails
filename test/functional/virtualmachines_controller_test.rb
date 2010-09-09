require 'test_helper'

class VirtualmachinesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:virtualmachines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create virtualmachines" do
    assert_difference('Virtualmachines.count') do
      post :create, :virtualmachines => { }
    end

    assert_redirected_to virtualmachines_path(assigns(:virtualmachines))
  end

  test "should show virtualmachines" do
    get :show, :id => virtualmachines(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => virtualmachines(:one).to_param
    assert_response :success
  end

  test "should update virtualmachines" do
    put :update, :id => virtualmachines(:one).to_param, :virtualmachines => { }
    assert_redirected_to virtualmachines_path(assigns(:virtualmachines))
  end

  test "should destroy virtualmachines" do
    assert_difference('Virtualmachines.count', -1) do
      delete :destroy, :id => virtualmachines(:one).to_param
    end

    assert_redirected_to virtualmachines_path
  end
end
