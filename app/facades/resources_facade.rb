class ResourcesFacade

  def self.visual_resources(search_term)
    Resource.new(resource_hash(search_term))
  end

  private

  def self.resource_hash(search_term)
    video_data = VideoService.video_search(search_term)
    image_data = ImageService.image_search(search_term)
      {
      country: search_term,
      video: { title: video_data[0][:snippet][:title],
                youtube_video_id: video_data[0][:id][:videoId]
              },
      images: image_data[:results].map do |image|
          {
           alt_tag: image[:alt_description],
            url: image[:urls][:regular]
          }
        end
      }
  end
end
