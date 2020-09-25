require "application_system_test_case"

class GameCategoriesTest < ApplicationSystemTestCase
  setup do
    @game_category = game_categories(:one)
  end

  test "visiting the index" do
    visit game_categories_url
    assert_selector "h1", text: "Game Categories"
  end

  test "creating a Game category" do
    visit game_categories_url
    click_on "New Game Category"

    fill_in "Article", with: @game_category.article_id
    fill_in "Category", with: @game_category.category_id
    click_on "Create Game category"

    assert_text "Game category was successfully created"
    click_on "Back"
  end

  test "updating a Game category" do
    visit game_categories_url
    click_on "Edit", match: :first

    fill_in "Article", with: @game_category.article_id
    fill_in "Category", with: @game_category.category_id
    click_on "Update Game category"

    assert_text "Game category was successfully updated"
    click_on "Back"
  end

  test "destroying a Game category" do
    visit game_categories_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Game category was successfully destroyed"
  end
end
