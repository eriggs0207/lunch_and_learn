require 'rails_helper'

RSpec.describe 'Tourist Sites API | Index' do
  describe 'Tourist Index', :vcr do
    it 'render JSON of tourist sights by country sent in a query' do

      country_params = {
        country: "latvia"
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      get '/api/v1/tourist_sights', headers: headers, params: country_params
      expect(response).to be_successful
      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response[:data]).to be_an(Array)

      parsed_response[:data].each do |response|
        expect(response).to have_key(:attributes)
        expect(response).to have_key(:id)
        expect(response[:attributes]).to have_key(:name)
        expect(response[:attributes]).to have_key(:address)
        expect(response[:attributes]).to have_key(:place_id)
      end
    end

    it 'returns an empty array when no country field is filled in' do

      country_params = {
        country: ""
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      get '/api/v1/tourist_sights', headers: headers, params: country_params
      expect(response).to be_successful
      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response).to be_an(Hash)
      expect(parsed_response[:data]).to be_an(Array)
      expect(parsed_response[:data].count).to eq(0)
      expect(parsed_response[:data]).to eq([])

    end
  end
end
