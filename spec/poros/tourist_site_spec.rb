require 'rails_helper'

RSpec.describe TouristSight do
  before :each do

  @site_hash = { properties:
              {
                name: "Maison de Chateaubriand",
                formatted: "Maison de Chateaubriand, 87 Rue de Chateaubriand, 92290 Châtenay-Malabry, France",
                place_id: "1234567890"
              }
  }
  @site = TouristSight.new(@site_hash)
  end

  it 'instantiates' do

    expect(@site).to be_a(TouristSight)
  end

  it 'has attributes' do

    expect(@site.id).to eq(nil)
    expect(@site.name).to eq("Maison de Chateaubriand")
    expect(@site.address).to eq("Maison de Chateaubriand, 87 Rue de Chateaubriand, 92290 Châtenay-Malabry, France")
    expect(@site.place_id).to eq("1234567890")
  end
end
