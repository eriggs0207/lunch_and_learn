require 'rails_helper'

describe 'Tourist Sights Facade', :vcr do
  it 'find_attractions' do
    # country = CountryService.one_country("Latvia")
    # TouristSightsService.attraction_by_lnglat(country[1], country[0])
    sights = TouristSightsFacade.find_attractions("Latvia")

    expect(sights).to be_an(Array)
    # expect(sights[0]).to be_a(Recipe)
    # expect(sights[0].country).to eq("Thailand")
    # expect(country).to be_an(Array)
  end
end
