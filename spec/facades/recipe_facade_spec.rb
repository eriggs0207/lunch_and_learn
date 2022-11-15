require 'rails_helper'

describe 'Recipe Facade', :vcr do
  it 'random_search' do
    allow(CountryService).to receive(:random_country).and_return("Thailand")
    random = CountryService.random_country
    recipe = RecipeFacade.recipe_search("random_country")

    expect(recipe).to be_an(Array)
    expect(recipe[0]).to be_a(Recipe)
    expect(recipe[0].country).to eq(random)
    expect(random).to be_a(String)
  end

  it 'country_search' do
    recipe = RecipeFacade.recipe_search("Belgium")

    expect(recipe).to be_an(Array)
    expect(recipe[0]).to be_a(Recipe)
    expect(recipe[0].country).to eq("Belgium")
  end
end
