class VideoService

  def self.video_search(search_term)
    response = conn.get('/v3/search') do |f|
      f.params['part'] = 'snippet'
      f.params['channelId'] = 'UCluQ5yInbeAkkeCndNnUhpw'
      f.params['q'] = search_term
    end
    parse(response)[:items]
  end

private

  def self.conn
    Faraday.new(url: 'https://youtube.googleapis.com/youtube') do |f|
      f.params['key'] = ENV['YOUTUBE_API_KEY']
    end
  end

  def self.parse(response)
    JSON.parse(response.body, symbolize_names: true)
  end
end
