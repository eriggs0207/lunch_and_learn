require 'rails_helper'

RSpec.describe VideoService, :vcr do
  describe 'video_search' do
    it 'should return videos based on search' do
      videos = VideoService.video_search("Laos")

      expect(videos).to be_a(Hash)
      expect(videos).to have_key(:items)
      expect(videos[:items]).to be_an(Array)
      expect(videos[:items][0]).to have_key(:snippet)
    end
  end
end
