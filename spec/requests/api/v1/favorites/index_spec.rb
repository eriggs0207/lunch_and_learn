require 'rails_helper'

RSpec.describe 'Favorites API | Index' do
  describe 'Favorites Index', :vcr do
    context 'happy path' do
      it 'render JSON of user favorites when use api_key is sent in a query' do
        user = create(:user)
        favorites = create_list(:favorite, 10, user: user)

        api_key_params = {
          api_key: user.api_key
        }
        headers = {"CONTENT_TYPE" => "application/json"}

        get '/api/v1/favorites', headers: headers, params: api_key_params
        expect(response).to be_successful
        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response[:data]).to be_an(Array)
        expect(parsed_response[:data][0]).to have_key(:attributes)
        expect(parsed_response[:data][0]).to have_key(:type)
        expect(parsed_response[:data][0]).to have_key(:id)
        expect(parsed_response[:data][0][:type]).to eq("favorite")
        expect(parsed_response[:data][0][:attributes]).to be_a(Hash)
        expect(parsed_response[:data][0][:attributes]).to have_key(:recipe_title)
        expect(parsed_response[:data][0][:attributes]).to have_key(:recipe_link)
        expect(parsed_response[:data][0][:attributes]).to have_key(:country)
        expect(parsed_response[:data][0][:attributes]).to have_key(:created_at)
      end
    end

    context 'sad path' do
      it 'returns a 401 error if api_key is not valid' do
        api_key_params = {
          api_key: "1234567890"
        }
        headers = {"CONTENT_TYPE" => "application/json"}

        get '/api/v1/favorites', headers: headers, params: api_key_params
        expect(response).to have_http_status(401)
        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response).to be_a(Hash)
        expect(parsed_response[:errors][:message]).to eq("api key not vaild")
      end

      it 'returns a an empty array if user has no favorites' do
        user = create(:user)

        api_key_params = {
          api_key: user.api_key
        }
        headers = {"CONTENT_TYPE" => "application/json"}

        get '/api/v1/favorites', headers: headers, params: api_key_params
        expect(response).to be_successful
        parsed_response = JSON.parse(response.body, symbolize_names: true)

        expect(parsed_response[:data]).to be_an(Array)
        expect(parsed_response[:data]).to eq([])
      end
    end
  end
end
