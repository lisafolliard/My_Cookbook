class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)
  validates(:description, {:presence => true, :length => {:maximum => 15}})
  before_save(:capitalize_ingredient)

  private
    define_method(:capitalize_ingredient) do
      self.description=description().capitalize()
    end
end
