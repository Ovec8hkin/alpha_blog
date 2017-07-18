require "test_helper"

class CategoriesControllerTest < ActionController::TestCase

  def setup
    @category = Category.create(name: "Sports")
    @user = User.create(username: "Admin", email: "admin@alphablog.com", password: "password", admin: true)
  end

  test 'categories_index' do
    get :index
    assert_response :success
  end

  test 'categories_new' do
    session[:user_id] = @user.id
    get :new
    assert_response :success
  end

  test 'categories_show' do
    get(:show, {'id' => @category.id})
    assert_response :success
  end

  test 'deny_access_to_non_admin' do
    assert_no_difference 'Category.count' do
      post :create, category: {name: "Sports"}
    end
    assert_redirected_to categories_path
  end

end