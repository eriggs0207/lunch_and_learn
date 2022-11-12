require 'rails_helper'

RSpec.describe ImageService, :vcr do
  describe 'video_search' do
    it 'should return 10 photos based on search' do
      photos = ImageService.image_search("Laos")

      expect(photos).to be_an(Hash)
      expect(photos[:results]).to be_an(Array)
      expect(photos[:results].count).to eq(10)
      expect(photos[:results][0]).to have_key(:id)
      expect(photos[:results][0]).to have_key(:alt_description)
      expect(photos[:results][0]).to have_key(:urls)

    end
  end
end
