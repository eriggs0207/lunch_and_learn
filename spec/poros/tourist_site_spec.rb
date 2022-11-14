require 'rails_helper'

RSpec.describe TouristSight do
  before :each do

  @site_hash = { id: nil,
                  name: "Dauderi",
                  address: "Dauderi, Zāģeru iela 7, Riga, LV-1005, Latvia",
                  place_id: "51f4ef5ecebf1f3840590677eb3181804c40f00102f901127834070000000092030744617564657269"

  }
  @site = TouristSight.new(@site_hash)
  end

  xit 'instantiates' do

    expect(@site).to be_a(TouristSight)
  end

  xit 'has attributes' do

    expect(@site.id).to eq(nil)
    expect(@site.name).to eq("Dauderi")
    expect(@site.address).to eq("Dauderi, Zāģeru iela 7, Riga, LV-1005, Latvia")
    expect(@site.place_id).to eq("51f4ef5ecebf1f3840590677eb3181804c40f00102f901127834070000000092030744617564657269")
  end
end
