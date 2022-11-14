class CountryService

  def self.random_country
    response = conn.get('/v3.1/all')
    countries = parse(response)
    random = countries.sample
    random[:name][:common]
  end

  def self.one_country(search_term)
    response = conn.get("/v3.1/name/#{search_term}")
     info = parse(response)
    details = info.first
    x = details[:capitalInfo][:latlng]

    binding.pry
  end

private

  def self.conn
    Faraday.new(url: 'https://restcountries.com')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
