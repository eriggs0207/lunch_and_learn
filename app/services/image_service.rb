class ImageService

  def self.image_search(search_term)
    response = conn.get('/search/photos') do |f|
      f.params['query'] = search_term
      f.params['page'] = '1'
      f.params['per_page'] = '10'
    end
    parse(response)
  end

private

  def self.conn
    Faraday.new(url: 'https://api.unsplash.com') do |f|
      f.params['client_id'] = ENV['UNSPLASH_ACCESS']
    end
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
