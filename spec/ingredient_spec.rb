require('spec_helper')

describe(Ingredient) do
  describe('#recipes') do
    it('determines which recipe is used with which ingredient') do
      new_recipe = Recipe.create({:name => 'penne vodka'})
      new_ingredient = Ingredient.create({:description => 'pasta'})
      new_ingredient2 = Ingredient.create({:description => 'tomatoes'})
      new_ingredient3 = Ingredient.create({:description => 'basil'})
      new_ingredient.recipes.push(new_recipe)
      new_ingredient2.recipes.push(new_recipe)
      expect(new_ingredient.recipes()).to(eq([new_recipe]))
    end
  end

  it("validates the presence of a description") do
    ingredient = Ingredient.create({:description => ""})
    expect(ingredient.save()).to(eq(false))
  end

  it('validates the length of description at most 15 characters') do
    ingredient = Ingredient.new({:description => 'a'.*(16)})
    expect(ingredient.save()).to(eq(false))
  end
end
