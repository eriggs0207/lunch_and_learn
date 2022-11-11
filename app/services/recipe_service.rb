class RecipeService

  def self.recipe_search(search_term)
    response = conn.get('/search') do |f|
      f.params['q'] = search_term
    end
    parse(response)
    binding.pry 
  end

private

  def self.conn
    Faraday.new(url: 'https://api.edamam.com') do |f|
      f.params['app_id'] = ENV['RECIPE_API_ID']
      f.params['app_key'] = ENV['RECIPE_API_KEY']
    end
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
