require 'rails_helper'

RSpec.describe RecipeService, :vcr do
  describe 'recipe_search' do
    it 'should return recipes based on search' do
      recipes = RecipeService.recipe_search("Thailand")

      expect(recipes).to be_a(Hash)
      expect(recipes).to have_key(:hits)
      expect(recipes[:hits]).to be_an(Array)
      expect(recipes[:hits][0]).to have_key(:recipe)
    end
  end
end
