require 'rails_helper'

RSpec.describe CountryService, :vcr do
  describe 'random_country' do
    it 'should return a random country' do
      rand_country = CountryService.random_country

      expect(rand_country).to be_a(String)

    end
  end
  describe 'one_country' do
    it 'should return one country by search' do
      country = CountryService.one_country("france")

      expect(country).to be_an(Array)
    end
  end
end
