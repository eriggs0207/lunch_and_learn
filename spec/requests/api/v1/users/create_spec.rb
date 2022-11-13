require 'rails_helper'

RSpec.describe 'User API | Create' do
  describe 'User Create' do
    context 'happy path' do
      it 'successfully create a user' do

        user_params = {
          name: "Johnny Utah",
          email: "johnnyfootball@pointbreak.com"
        }
        headers = {"CONTENT_TYPE" => "application/json"}

        post '/api/v1/users', headers: headers, params: JSON.generate(user_params)
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful

        expect(parsed_response).to be_a(Hash)
        expect(parsed_response[:data]).to be_a(Hash)
        expect(parsed_response[:data]).to have_key(:id)
        expect(parsed_response[:data]).to have_key(:type)
        expect(parsed_response[:data]).to have_key(:attributes)
        expect(parsed_response[:data][:type]).to eq("user")
        expect(parsed_response[:data][:id]).to be_a(String)
        expect(parsed_response[:data][:attributes]).to have_key(:name)
        expect(parsed_response[:data][:attributes]).to have_key(:email)
        expect(parsed_response[:data][:attributes]).to have_key(:api_key)

        expect(User.all.count).to eq(1)
      end
    end
    context 'sad paths' do
      it 'returns a 400 error with missing params' do
        user_params = {

          email: "johnnyfootball@pointbreak.com"
        }
        headers = {"CONTENT_TYPE" => "application/json"}

        post '/api/v1/users', headers: headers, params: JSON.generate(user_params)
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(400)

        expect(parsed_response).to be_a(Hash)
        expect(parsed_response[:errors][:message]).to eq("All fields are required")
      end

      it 'returns a 400 error when email already exists' do
        user = create(:user, email: "johnnyfootball@pointbreak.com")

        user_params = {
          name: "Johnny Manziel",
          email: "johnnyfootball@pointbreak.com"
        }
        headers = {"CONTENT_TYPE" => "application/json"}

        post '/api/v1/users', headers: headers, params: JSON.generate(user_params)
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(400)

        expect(parsed_response).to be_a(Hash)
        expect(parsed_response[:errors][:message]).to eq("Email already exists")
      end
    end
  end
end
