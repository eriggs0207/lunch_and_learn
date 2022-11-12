require 'rails_helper'

RSpec.describe 'Recipe API | Index' do
  describe 'Recipe Index', :vcr do
    it 'render JSON of Recipe by country sent in a query' do

      country_params = {
        country: "Thailand"
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      get '/api/v1/recipes', headers: headers, params: country_params
      expect(response).to be_successful
      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response[:data]).to be_an(Array)
      expect(parsed_response[:data][0]).to have_key(:attributes)
      expect(parsed_response[:data][0]).to have_key(:id)
      expect(parsed_response[:data][1][:attributes]).to have_key(:title)
      expect(parsed_response[:data][1][:attributes]).to have_key(:url)
      expect(parsed_response[:data][1][:attributes]).to have_key(:country)
      expect(parsed_response[:data][1][:attributes]).to have_key(:image)
    end
  end
end
