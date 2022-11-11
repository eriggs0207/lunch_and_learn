require 'rails_helper'

RSpec.describe Recipe do
  recipe_hash = 

  it 'instantiates' do
    recipe = Recipe.new(recipe_hash)

    expect(weather1).to be_an(Recipe)
  end

  it 'has attributes' do
    recipe = Recipe.new(recipe_hash)

    expect(recipe.name).to eq(recipe_hash[:name])
    expect(recipe.temperature).to eq(recipe_hash[:temperature])
    expect(recipe.short_forecast).to eq(recipe_hash[:shortForecast])
    expect(recipe.detailed_forecast).to eq(recipe_hash[:detailedForecast])
  end
end
