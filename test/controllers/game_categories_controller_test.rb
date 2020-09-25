require 'test_helper'

class GameCategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @game_category = game_categories(:one)
  end

  test "should get index" do
    get game_categories_url
    assert_response :success
  end

  test "should get new" do
    get new_game_category_url
    assert_response :success
  end

  test "should create game_category" do
    assert_difference('GameCategory.count') do
      post game_categories_url, params: { game_category: { article_id: @game_category.article_id, category_id: @game_category.category_id } }
    end

    assert_redirected_to game_category_url(GameCategory.last)
  end

  test "should show game_category" do
    get game_category_url(@game_category)
    assert_response :success
  end

  test "should get edit" do
    get edit_game_category_url(@game_category)
    assert_response :success
  end

  test "should update game_category" do
    patch game_category_url(@game_category), params: { game_category: { article_id: @game_category.article_id, category_id: @game_category.category_id } }
    assert_redirected_to game_category_url(@game_category)
  end

  test "should destroy game_category" do
    assert_difference('GameCategory.count', -1) do
      delete game_category_url(@game_category)
    end

    assert_redirected_to game_categories_url
  end
end
