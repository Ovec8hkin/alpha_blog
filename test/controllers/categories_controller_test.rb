require "test_helper"

class CategoriesControllerTest < ActionController::TestCase

  def setup
    @category = Category.create(name: "Sports")
  end

  test 'categories_index' do
    get :index
    assert_response :success
  end

  test 'categories_new' do
    get :new
    assert_response :success
  end

  test 'categories_show' do
    get(:show, {'id' => @category.id})
    assert_response :success
  end

end