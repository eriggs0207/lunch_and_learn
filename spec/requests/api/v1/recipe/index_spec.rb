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
      expect(parsed_response[:data].count).to eq(10)

      parsed_response[:data].each do |response|
        expect(response).to have_key(:attributes)
        expect(response).to have_key(:id)
        expect(response[:attributes]).to have_key(:title)
        expect(response[:attributes]).to have_key(:url)
        expect(response[:attributes]).to have_key(:image)
        expect(response[:attributes]).to have_key(:country)
        expect(response[:attributes][:country]).to eq("Thailand")
      end
    end

    it 'returns an empty array with no country field filled in' do

      country_params = {
        country: ""
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      get '/api/v1/recipes', headers: headers, params: country_params
      expect(response).to be_successful
      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to be_an(Hash)
      expect(parsed_response[:data]).to be_an(Array)
      expect(parsed_response[:data].count).to eq(0)
      expect(parsed_response[:data]).to eq([])

    end
  end
end
