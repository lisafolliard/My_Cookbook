# Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

require("bundler/setup")
Bundler.require(:default)
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
  recipe = Recipe.create({:name => name})
  @recipes = Recipe.all()
  erb(:recipes)
end

get('/ingredients') do
  @ingredients = Ingredient.all()
  erb(:ingredients)
end

post('/ingredients') do
  description = params.fetch('description')
  ingredient = Ingredient.create({:description => description})
  @ingredients = Ingredient.all()
  erb(:ingredients)
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
