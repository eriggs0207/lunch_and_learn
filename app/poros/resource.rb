class Resource
  attr_reader :id,
              :country,
              :video,
              :images

  def initialize(resource_hash)
    @id = nil
    @country = resource_hash[:country]
    @video = verify_media(resource_hash[:video])
    @images = verify_media(resource_hash[:images])
  end

  def verify_media(media)
    if media.nil?
      return []
    else
      return media
    end
  end

end
