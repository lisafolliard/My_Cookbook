require("bundler/setup")
Bundler.require(:default, :test)
Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  erb(:index)
end

get('/recipes') do
  @recipes = Recipe.all()
  erb(:recipes)
end

post('/recipes') do
  name = params.fetch("name")
  @recipe = Recipe.create({:name => name})
  @recipes = Recipe.all()
  if @recipe.save()
    erb(:recipes)
  else
    erb(:recipe_errors)
  end
end

get('/recipes/:id/edit') do
  @recipe = Recipe.find(params["id"].to_i)
  erb(:recipe_edit)
end

get('/recipes/:id/delete') do
  recipe = Recipe.find(params["id"].to_i)
  @recipes = Recipe.all()
  recipe.destroy
  erb(:recipes)
end

patch('/recipes') do
  name = params.fetch("name")
  id = params.fetch("id").to_i()
  recipe = Recipe.find(id)
  recipe.update({:name => name})
  @recipes = Recipe.all()
  erb(:recipes)
end

get('/recipes/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i)
  @ingredients = Ingredient.all()
  erb(:recipe_info)
end

patch('/recipes/:id') do
  recipe_id = params.fetch("id").to_i()
  @recipe = Recipe.find(recipe_id)
  ingredient_ids = params.fetch("ingredient_id")

  # one method to add ingredients to @recipe
  ingredient_ids.each() do |ingredient_id|
    new_ingredient = Ingredient.find(ingredient_id)
    @recipe.ingredients.push(new_ingredient)
  end

  # replace all ingredients for this @recipe
  # @recipe.update({:ingredient_ids => ingredient_ids})

  @ingredients = Ingredient.all()
  erb(:recipe_info)
end

get('/ingredients') do
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

post('/ingredients') do
  description = params.fetch('description')
  @ingredient = Ingredient.create({:description => description})
  @ingredients = Ingredient.all()
  if @ingredient.save()
    erb(:ingredients)
  else
    erb(:ingredient_errors)
  end
end

get('/ingredients/:id/edit') do
  @ingredient = Ingredient.find(params['id'].to_i)
  erb(:ingredient_edit)
end

get('/ingredients/:id/delete') do
  ingredient = Ingredient.find(params["id"].to_i)
  @ingredients = Ingredient.all()
  ingredient.destroy
  erb(:ingredients)
end

patch('/ingredients') do
  description = params.fetch('description')
  id = params.fetch('id').to_i()
  ingredient = Ingredient.find(id)
  ingredient.update({:description => description})
  @ingredients = Ingredient.all()
  erb(:ingredients)
end


get('/ingredients/:id') do
  @ingredient = Ingredient.find(params.fetch("id").to_i)
  @recipes = Recipe.all()
  erb(:ingredient_info)
end

patch('/ingredients/:id') do
  ingredient_id = params.fetch("id").to_i()
  @ingredient = Ingredient.find(ingredient_id)
  recipe_ids = params.fetch("recipe_id")
  recipe_ids.each() do |recipe_id|
    new_recipe = Recipe.find(recipe_id)
    @ingredient.recipes.push(new_recipe)
  end
  @recipes = Recipe.all()
  erb(:ingredient_info)
end
