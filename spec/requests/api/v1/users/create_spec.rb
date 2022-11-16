require 'rails_helper'

RSpec.describe 'User API | Create' do
  describe 'User Create' do
    context 'happy path' do
      it 'successfully create a user' do

        user_params = {
          name: "Mama Fratelli",
          email: "ahsloth@fratellirestaurant.com"
        }
        headers = {"CONTENT_TYPE" => "application/json"}

        post '/api/v1/users', headers: headers, params: JSON.generate(user_params)
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(response).to be_successful
          expect(response).to have_http_status(201)

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
      it 'returns a 400 error with missing email' do
        user_params = {

          name: "Fratelli Bros"
        }
        headers = {"CONTENT_TYPE" => "application/json"}

        post '/api/v1/users', headers: headers, params: JSON.generate(user_params)
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(400)

        expect(parsed_response).to be_a(Hash)
        expect(parsed_response[:errors][:email]).to eq([
            "can't be blank"
        ])
      end

      it 'returns a 400 error with missing name' do
        user_params = {

          email: "fratellibros@goonies.com"
        }
        headers = {"CONTENT_TYPE" => "application/json"}

        post '/api/v1/users', headers: headers, params: JSON.generate(user_params)
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(400)

        expect(parsed_response).to be_a(Hash)
        expect(parsed_response[:errors][:name]).to eq([
            "can't be blank"
        ])
      end

      it 'returns a 400 error when email already exists' do
        user = create(:user, email: "johnnyfootball@pointbreak.com")

        user_params = {
          name: "Sloth",
          email: "johnnyfootball@pointbreak.com"
        }
        headers = {"CONTENT_TYPE" => "application/json"}

        post '/api/v1/users', headers: headers, params: JSON.generate(user_params)
        parsed_response = JSON.parse(response.body, symbolize_names: true)
        expect(response).to have_http_status(400)

        expect(parsed_response).to be_a(Hash)
        expect(parsed_response[:errors][:email]).to eq([
            "has already been taken"
        ])
      end
    end
  end
end
