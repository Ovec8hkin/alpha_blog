require "test_helper"

class CategoryTest < ActiveSupport::TestCase

  def setup
    @category = Category.new(name: "sports")
  end

  test "category_valid" do
    assert @category.valid?
  end

  test "name_present" do
    @category.name = ""
    assert_not @category.valid?
  end

  test "name_unique" do
    @category.save
    category2 = Category.new(name: "sports")
    assert_not category2.valid?
  end

  test "name_length_max" do
    @category.name = "a"*26
    assert_not @category.valid?
  end

  test "name_length_min" do
    @category.name = "a"*2
    assert_not @category.valid?
  end


end