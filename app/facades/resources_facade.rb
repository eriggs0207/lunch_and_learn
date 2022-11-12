class ResourcesFacade

  def visual_resources(search_term)
    video_data = VideoService.video_search(search_term)
    image_data = ImageService.image_search(search_term)
    image_data[:results].map do |image|
      Resource.new(video_data[0], search_term, image)
    end
  end
end
