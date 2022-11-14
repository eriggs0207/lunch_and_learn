require 'rails_helper'

RSpec.describe TouristSightsService, :vcr do
  describe 'attraction_by_lnglat' do
    it 'should attraactions by coordinates' do
      attractions = TouristSightsService.attraction_by_lnglat("2.33", "48.87")

      expect(attractions).to be_a(Hash)

    end
  end
end
