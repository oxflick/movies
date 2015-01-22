require 'test_helper'

class SimilaritiesControllerTest < ActionController::TestCase
  setup do
    @similarity = similarities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:similarities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create similarity" do
    assert_difference('Similarity.count') do
      post :create, similarity: { actor: @similarity.actor, image: @similarity.image, name: @similarity.name, why: @similarity.why }
    end

    assert_redirected_to similarity_path(assigns(:similarity))
  end

  test "should show similarity" do
    get :show, id: @similarity
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @similarity
    assert_response :success
  end

  test "should update similarity" do
    patch :update, id: @similarity, similarity: { actor: @similarity.actor, image: @similarity.image, name: @similarity.name, why: @similarity.why }
    assert_redirected_to similarity_path(assigns(:similarity))
  end

  test "should destroy similarity" do
    assert_difference('Similarity.count', -1) do
      delete :destroy, id: @similarity
    end

    assert_redirected_to similarities_path
  end
end
