require 'rails_helper'

RSpec.describe Recipe do
  before :each do

  @recipe_hash = { id: nil,
                  label: 'recipe',
                  url: 'recipe.com',
                  image: 'recipe.jpg'

  }
  @recipe = Recipe.new(@recipe_hash, "Thailand")
  end

  it 'instantiates' do

    expect(@recipe).to be_a(Recipe)
  end

  it 'has attributes' do

    expect(@recipe.id).to eq(nil)
    expect(@recipe.title).to eq(@recipe_hash[:label])
    expect(@recipe.url).to eq(@recipe_hash[:url])
    expect(@recipe.country).to eq("Thailand")
    expect(@recipe.image).to eq(@recipe_hash[:image])
  end
end
