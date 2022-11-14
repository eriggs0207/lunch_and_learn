require 'rails_helper'

describe 'Tourist Sights Facade', :vcr do
  it 'find_attractions' do
    country = CountryService.one("France")
    sights = TouristSightsFacade.find_attractions(country[1], country[0])
    
    expect(sights).to be_an(Array)
    expect(sighhts[0]).to be_a(Recipe)
    expect(sights[0].country).to eq("Thailand")
    expect(random).to be_a(String)
  end
end
