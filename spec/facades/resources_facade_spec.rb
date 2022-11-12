require 'rails_helper'

describe 'Resources Facade', :vcr do
  it 'learning_resources_search' do
    resources = ResourcesFacade.visual_resources("Laos")

    expect(resources).to be_an(Array)
    expect(resources[0]).to be_a(Resource)
    expect(resources[0].country).to eq("Laos")
  end
end
