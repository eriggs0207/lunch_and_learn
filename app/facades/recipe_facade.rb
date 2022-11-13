class RecipeFacade

  def self.recipe_search(search_term)
    if search_term == 'random_country'
      search_term = CountryService.random_country
    end
    recipe_data = RecipeService.recipe_search(search_term)
    country = recipe_data[:q]
    recipe_data[:hits].map do |data|
      Recipe.new(data[:recipe], country)
    end
  end
end
