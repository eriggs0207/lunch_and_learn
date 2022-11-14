class TouristSightsFacade

  def self.find_attractions(search_term)
    country = CountryService.one_country(search_term)
    sight_data = TouristSightsService.attraction_by_lnglat(country[1], country[0])
    sight_data[:features].map do |data|
      x = TouristSight.new(data)
      binding.pry 
    end
  end
end
