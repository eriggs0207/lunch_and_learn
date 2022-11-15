require 'rails_helper'

describe 'Recipe Facade', :vcr do
  it 'recipes_search' do
    random = CountryService.random_country
    recipe = RecipeFacade.recipe_search("Thailand")
    
    expect(recipe).to be_an(Array)
    expect(recipe[0]).to be_a(Recipe)
    expect(recipe[0].country).to eq("Thailand")
    expect(random).to be_a(String)
  end
end
