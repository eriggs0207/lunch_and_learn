class RecipeFacade

  def self.recipe_search(search_term)
    recipe_data = RecipeService.recipe_search(search_term)
    country = recipe_data[:q]
    recipe_data[:hits].map do |data|
      Recipe.new(data[:recipe], country)
    end
  end
end
