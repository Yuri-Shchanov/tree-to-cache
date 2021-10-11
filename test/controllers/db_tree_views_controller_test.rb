require "test_helper"

class DbTreeViewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @db_tree_view = db_tree_views(:one)
  end

  test "should get index" do
    get db_tree_views_url
    assert_response :success
  end

  test "should get new" do
    get new_db_tree_view_url
    assert_response :success
  end

  test "should create db_tree_view" do
    assert_difference('DbTreeView.count') do
      post db_tree_views_url, params: { db_tree_view: {  } }
    end

    assert_redirected_to db_tree_view_url(DbTreeView.last)
  end

  test "should show db_tree_view" do
    get db_tree_view_url(@db_tree_view)
    assert_response :success
  end

  test "should get edit" do
    get edit_db_tree_view_url(@db_tree_view)
    assert_response :success
  end

  test "should update db_tree_view" do
    patch db_tree_view_url(@db_tree_view), params: { db_tree_view: {  } }
    assert_redirected_to db_tree_view_url(@db_tree_view)
  end

  test "should destroy db_tree_view" do
    assert_difference('DbTreeView.count', -1) do
      delete db_tree_view_url(@db_tree_view)
    end

    assert_redirected_to db_tree_views_url
  end
end
