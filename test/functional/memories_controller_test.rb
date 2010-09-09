require 'test_helper'

class MemoriesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:memories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create memories" do
    assert_difference('Memories.count') do
      post :create, :memories => { }
    end

    assert_redirected_to memories_path(assigns(:memories))
  end

  test "should show memories" do
    get :show, :id => memories(:one).to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => memories(:one).to_param
    assert_response :success
  end

  test "should update memories" do
    put :update, :id => memories(:one).to_param, :memories => { }
    assert_redirected_to memories_path(assigns(:memories))
  end

  test "should destroy memories" do
    assert_difference('Memories.count', -1) do
      delete :destroy, :id => memories(:one).to_param
    end

    assert_redirected_to memories_path
  end
end
