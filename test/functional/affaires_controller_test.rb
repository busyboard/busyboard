require 'test_helper'

class AffairesControllerTest < ActionController::TestCase
  setup do
    @affaire = affaires(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:affaires)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create affaire" do
    assert_difference('Affaire.count') do
      post :create, :affaire => @affaire.attributes
    end

    assert_redirected_to affaire_path(assigns(:affaire))
  end

  test "should show affaire" do
    get :show, :id => @affaire.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @affaire.to_param
    assert_response :success
  end

  test "should update affaire" do
    put :update, :id => @affaire.to_param, :affaire => @affaire.attributes
    assert_redirected_to affaire_path(assigns(:affaire))
  end

  test "should destroy affaire" do
    assert_difference('Affaire.count', -1) do
      delete :destroy, :id => @affaire.to_param
    end

    assert_redirected_to affaires_path
  end
end
