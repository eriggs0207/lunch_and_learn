class TouristSightsService

  def self.attraction_by_lnglat(lng, lat)
    response = conn.get('/v2/places') do |f|
      f.params['categories'] = 'tourism.sights'
      f.params['filter'] = "circle:#{lng},#{lat},20000"
    end
    parse(response)
  end

private

  def self.conn
    Faraday.new(url: 'https://api.geoapify.com') do |f|
      f.params['apiKey'] = ENV['GEOAPIFY_KEY']
    end
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
