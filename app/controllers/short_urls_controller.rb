class ShortUrlsController < ApplicationController
  def create
    short_url = BitlyUrlShortenerApi.create_short_url(params[:long_url])
    render json: { short_url: short_url }
  end
end
