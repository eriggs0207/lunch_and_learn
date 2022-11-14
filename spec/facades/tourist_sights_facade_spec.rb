require 'rails_helper'

describe 'Tourist Sights Facade', :vcr do
  it 'find_attractions' do
    sights = TouristSightsFacade.find_attractions("Latvia")

    expect(sights).to be_an(Array)
    expect(sights[0]).to be_a(TouristSight)
  end
end
