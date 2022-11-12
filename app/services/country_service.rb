class CountryService

  def self.random_country
    response = conn.get('/v3.1/all')
    countries = parse(response)
    random = countries.sample
    random[:name][:common]
  end

private

  def self.conn
    Faraday.new(url: 'https://restcountries.com')
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
