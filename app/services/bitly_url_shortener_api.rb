class BitlyUrlShortenerApi
  BASE_PATH = Rails.application.secrets.bitly_url_shortener['base_path']
  SECRET_KEY = Rails.application.secrets.bitly_url_shortener['key']

  def self.create_short_url(url)
    uri = URI('https://api-ssl.bitly.com/v3/shorten')
    params = { access_token: SECRET_KEY, longUrl: url }
    uri.query = URI.encode_www_form(params)
    res = JSON.parse(Net::HTTP.get_response(uri).body)
    res['status_code'] == 200 ? res['data']['url'] : 'Something went wrong!!'
  end
end
