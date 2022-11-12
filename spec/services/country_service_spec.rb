require 'rails_helper'

RSpec.describe CountryService, :vcr do
  describe 'random_country' do
    it 'should return a random country' do
      country = CountryService.random_country

      expect(country).to be_a(String)
      
    end
  end
end
