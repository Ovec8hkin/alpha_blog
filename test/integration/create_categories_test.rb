require 'test_helper'

class CreateCategoriesTest < ActionDispatch::IntegrationTest

  test 'get_new_form' do
    get new_category_path
    assert_template 'categories/new'
    assert_difference 'Category.count', 1 do
      post categories_path, category: {name: "Sports"}
      follow_redirect!
    end
    assert_template 'categories/index'
    assert_match "Sports", response.body
  end

  test 'invalid_category_submissions' do
    get new_category_path
    assert_template 'categories/new'
    assert_no_difference 'Category.count' do
      post categories_path, category: {name: ""}
    end
    assert_template 'categories/new'
    assert_select "h3.panel-title"
    assert_select "div.panel-body"
  end

end