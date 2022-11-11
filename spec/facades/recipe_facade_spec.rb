require 'rails_helper'

describe 'Recipe Facade', :vcr do
  it 'recipes_search'do
    recipe = RecipeFacade.recipe_search('Thailand')

    expect(recipe).to be_an(Array)
  end
end
