require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  def setup
    @chef = Chef.create(chefname: "Chef Bob", email: "bob@example.com")
    @recipe = @chef.recipes.build(name: "Chicken Parm", summary: "The best chicken parm ever", description: "Combine Chicken and Parmesan.  Serve warm.")
  end
  
  test "Recipe should be valid" do
    assert @recipe.valid?
    
  end
  
  test "chef id should be present" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end
  
  test "Name should be present" do
    @recipe.name = " "
    assert_not @recipe.valid?
  end
  
  test "Name length should not be too long" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
    
  end
  
  test "Name length should not be too short" do
    @recipe.name = "a" * 3
    assert_not @recipe.valid?
  end
  
  test "Summary should be present" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end
  
  test "Summary length should not be too long" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end
  
  test "Summary length should not be too short" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?
  end
  
  test "Description should be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end
  
  test "Description length should not be too long" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end
  
  test "Description length should not be too short" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
  end
  
end