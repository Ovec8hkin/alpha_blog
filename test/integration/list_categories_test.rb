require 'test_helper'

class ListCategoriesTest < ActionDispatch::IntegrationTest

  def setup
    @cat1 = Category.create(name: "Books")
    @cat2 = Category.create(name: "Programming")
  end

  test "show_categories_listing" do

    get categories_path
    assert_template 'categories/index'
    assert_select "a[href=?]", category_path(@cat1), text: @cat1.name
    assert_select "a[href=?]", category_path(@cat2), text: @cat2.name

  end

end