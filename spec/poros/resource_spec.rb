require 'rails_helper'

RSpec.describe Resource do
  before :each do

  resource_data = {
            country: "Laos",
            video: {
                title: "A Super Quick History of Laos",
                youtube_video_id: "uw8hjVqxMXw"
            },
            images: [
                {
                    alt_tag: "girl in white shirt standing beside brown wooden fence",
                    url: "https://images.unsplash.com/photo-1610974046321-d346b59735b3?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwzODAwMzZ8MHwxfHNlYXJjaHwxfHxMYW9zfGVufDB8fHx8MTY2ODIzNTIxMA&ixlib=rb-4.0.3&q=80&w=1080"
                }]}
  @resource = Resource.new(resource_data)
  end

  it 'instantiates' do

    expect(@resource).to be_a(Resource)
  end

  it 'has attributes' do

    expect(@resource.country).to eq("Laos")
    expect(@resource.video).to be_a(Hash)
    expect(@resource.images).to be_an(Array)
    expect(@resource.video).to have_key(:title)
    expect(@resource.video).to have_key(:youtube_video_id)
  end

  it 'can verify media is present' do

    media = nil
    media1 = "videos"

    expect(@resource.verify_media(media)).to eq([])
    expect(@resource.verify_media(media1)).to eq("videos")
  end 
end
