class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)
  validates(:description, {:presence => true, :length => {:maximum => 15}})
end
