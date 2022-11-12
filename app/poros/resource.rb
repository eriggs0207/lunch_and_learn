class Resource
  attr_reader :country,
              :title,
              :youtube_video_id,
              :alt_tag,
              :url

  def initialize(video_data, country, image_data)
    @country = country
    @title = video_data[:snippet][:title]
    @youtube_video_id = video_data[:id][:videoId]
    @alt_tag = image_data[:alt_description]
    @url = image_data[:urls][:regular]
  end
end
