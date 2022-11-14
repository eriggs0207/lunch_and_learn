require 'rails_helper'

describe 'Tourist Sights Facade', :vcr do
  it 'find_attractions' do
    country = CountryService.one("France")
    sights = TouristSightsFacade.find_attractions()

    expect(recipe).to be_an(Array)
    expect(recipe[0]).to be_a(Recipe)
    expect(recipe[0].country).to eq("Thailand")
    expect(random).to be_a(String)
  end
end
