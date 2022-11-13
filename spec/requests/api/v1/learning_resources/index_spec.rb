require 'rails_helper'

RSpec.describe 'Learning Resources API | Index' do
  describe 'Learning Resources Index', :vcr do
    it 'render JSON of learning resources sent in a query' do

      country_params = {
        country: "Laos"
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      get '/api/v1/learning_resources', headers: headers, params: country_params
      expect(response).to be_successful
      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response[:data]).to be_a(Hash)
      expect(parsed_response[:data]).to have_key(:attributes)
      expect(parsed_response[:data]).to have_key(:type)
      expect(parsed_response[:data]).to have_key(:id)
      expect(parsed_response[:data][:type]).to eq("learning_resource")
      expect(parsed_response[:data][:attributes]).to have_key(:country)
      expect(parsed_response[:data][:attributes][:country]).to eq(country_params[:country])
      expect(parsed_response[:data][:attributes]).to have_key(:video)
      expect(parsed_response[:data][:attributes][:video]).to be_a(Hash)
      expect(parsed_response[:data][:attributes][:video]).to have_key(:title)
      expect(parsed_response[:data][:attributes][:images]).to be_an(Array)
    end

    it 'returns an empty array when no country field is filled in' do

      country_params = {
        country: ""
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      get '/api/v1/learning_resources', headers: headers, params: country_params
      expect(response).to be_successful
      parsed_response = JSON.parse(response.body, symbolize_names: true)

      expect(parsed_response[:data]).to be_a(Hash)
      expect(parsed_response[:data].count).to eq(0)
      expect(parsed_response[:data]).to eq({})
    end
  end
end
