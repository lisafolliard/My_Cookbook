class IngredientsRecipes < ActiveRecord::Migration
  def change
    create_table(:ingredients_recipes) do |t|
      t.column(:ingredient_id, :int)
      t.column(:recipe_id, :int)

      t.timestamps()
    end
  end
end
