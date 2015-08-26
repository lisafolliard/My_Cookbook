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







end
