class Recipe
  attr_reader :id,
              :title,
              :url,
              :country,
              :image

  def initialize(recipe_data, country)
    @id = nil
    @title = recipe_data[:label]
    @url = recipe_data[:url]
    @country = country
    @image = recipe_data[:image]
  end
end
