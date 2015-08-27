class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:ingredients)
  validates(:name, :presence => true)
  before_save(:capitalize_letter)

  # scope(:not_tried, -> do
  #   where({:tried => false})
  # end)

  private

  define_method(:capitalize_letter) do
    self.name=name().capitalize()
  end
end
