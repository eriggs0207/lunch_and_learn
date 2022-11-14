require 'rails_helper'

RSpec.describe 'Favorites API | Create' do
  describe 'Favorite Create', :vcr do
    before :each do
      @user = create(:user)
      @country = "Thailand"
      @recipe = RecipeFacade.recipe_search(@country)[0]
    end
    context 'happy path' do
      it 'successfully creates a favorite' do

        fav_params = {
          api_key: @user.api_key,
          country: @country,
          recipe_link: @recipe.url,
          recipe_title: @recipe.title

        }
        headers = {"CONTENT_TYPE" => "application/json"}

        post '/api/v1/favorites', headers: headers, params: JSON.generate(fav_params)
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
      end
    end
  end
end
