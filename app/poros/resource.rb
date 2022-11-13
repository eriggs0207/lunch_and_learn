class Resource
  attr_reader :id,
              :country,
              :video,
              :images

  def initialize(resource_hash)
    @id = nil
    @country = resource_hash[:country]
    @video = resource_hash[:video]
    @images = resource_hash[:images]
  end
end
