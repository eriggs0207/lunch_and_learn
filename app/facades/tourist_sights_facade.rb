class RecipeFacade

  def self.find_attractions(search_term)
    country = CountryService.one_country(search_term)
    sight_data = TouristSightsService.find_attractions(country[1], country[0])
    sight[:data]
    recipe_data[:hits].map do |data|
      Recipe.new(data[:recipe], country)
    end
  end
end
