require "application_system_test_case"

class DbTreeViewsTest < ApplicationSystemTestCase
  setup do
    @db_tree_view = db_tree_views(:one)
  end

  test "visiting the index" do
    visit db_tree_views_url
    assert_selector "h1", text: "Db Tree Views"
  end

  test "creating a Db tree view" do
    visit db_tree_views_url
    click_on "New Db Tree View"

    click_on "Create Db tree view"

    assert_text "Db tree view was successfully created"
    click_on "Back"
  end

  test "updating a Db tree view" do
    visit db_tree_views_url
    click_on "Edit", match: :first

    click_on "Update Db tree view"

    assert_text "Db tree view was successfully updated"
    click_on "Back"
  end

  test "destroying a Db tree view" do
    visit db_tree_views_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Db tree view was successfully destroyed"
  end
end
