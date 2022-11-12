require 'rails_helper'

RSpec.describe VideoService, :vcr do
  describe 'video_search' do
    it 'should return videos based on search' do
      videos = VideoService.video_search("Laos")

      expect(videos).to be_an(Array)
      expect(videos[0]).to have_key(:id)
      expect(videos[0][:id]).to have_key(:videoId)
      expect(videos[0]).to have_key(:snippet)
      expect(videos[0][:snippet]).to have_key(:title)
    end
  end
end
