require 'test_helper'

class LotesControllerTest < ActionController::TestCase
  setup do
    @lote = lotes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:lotes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create lote" do
    assert_difference('Lote.count') do
      post :create, lote: { coord: @lote.coord, memorial: @lote.memorial, numero: @lote.numero, superficie: @lote.superficie }
    end

    assert_redirected_to lote_path(assigns(:lote))
  end

  test "should show lote" do
    get :show, id: @lote
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @lote
    assert_response :success
  end

  test "should update lote" do
    patch :update, id: @lote, lote: { coord: @lote.coord, memorial: @lote.memorial, numero: @lote.numero, superficie: @lote.superficie }
    assert_redirected_to lote_path(assigns(:lote))
  end

  test "should destroy lote" do
    assert_difference('Lote.count', -1) do
      delete :destroy, id: @lote
    end

    assert_redirected_to lotes_path
  end
end
