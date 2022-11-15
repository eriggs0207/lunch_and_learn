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

        expect(parsed_response).to be_a(Hash)
        expect(parsed_response[:success][:message]).to eq("Favorite added successfully")

        expect(Favorite.all.count).to eq(1)
      end
    end

    context 'sad path' do
      it 'returns a 401 error when api_key is not present' do

        fav_params = {
          api_key: "",
          country: @country,
          recipe_link: @recipe.url,
          recipe_title: @recipe.title

        }
        headers = {"CONTENT_TYPE" => "application/json"}

        post '/api/v1/favorites', headers: headers, params: JSON.generate(fav_params)
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(401)


        expect(parsed_response).to be_a(Hash)
        expect(parsed_response[:errors][:message]).to eq("api key not vaild")

      end
    end 
  end
end
