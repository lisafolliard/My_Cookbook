require('spec_helper')

describe(Recipe) do
  describe('#ingredients') do
    it('determines which ingredients belongs to which recipe') do
      new_ingredient = Ingredient.create({:description => 'lime'})
      new_ingredient2 = Ingredient.create({:description => 'strawberry'})
      new_ingredient3 = Ingredient.create({:description => 'rum'})
      new_recipe = Recipe.create({:name => 'margarita'})
      new_recipe.ingredients.push(new_ingredient)
      new_recipe.ingredients.push(new_ingredient2)
      expect(new_recipe.ingredients()).to(eq([new_ingredient, new_ingredient2]))
    end
  end

  it("validates the presence of a description") do
    recipe = Recipe.create({:name => ""})
    expect(recipe.save()).to(eq(false))
  end

  it("capitalizes the first letter of a recipe") do
    recipe = Recipe.create({:name => "cinnamon toast crunch"})
    expect(recipe.name).to(eq("Cinnamon toast crunch"))
  end

  describe('.not_tried') do
    it('returns the recipes that have not been tried') do
      not_tried_recipe1 = Recipe.create({:name => 'ricotta pancakes', :tried => false})
      not_tried_recipe2 = Recipe.create({:name => 'french fries', :tried => false})
      not_tried_recipes = [not_tried_recipe1, not_tried_recipe2]
      tried_recipe = Recipe.create({:name => 'nachos', :tried => true})
      expect(Recipe.not_tried()).to(eq(not_tried_recipes))
    end
  end
end
