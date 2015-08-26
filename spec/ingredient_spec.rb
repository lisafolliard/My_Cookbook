require('spec_helper')

describe(Ingredient) do
  it("validates the presence of a description") do
    ingredient = Ingredient.create({:description => ""})
    expect(ingredient.save()).to(eq(false))
  end
end
