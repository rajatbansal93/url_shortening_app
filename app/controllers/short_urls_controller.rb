class ShortUrlsController < ApplicationController
  before_action :check_params

  def create
    response = BitlyUrlShortenerApi.create_short_url(params[:long_url])
    if response[:staus] == 200
      render json: { short_url: short_url }
    else
      render json: { error: response[:error] }, status: 400
    end
  end

  private
    def check_params
      unless params[:long_url].present?
        render json: { error: "Url cannot be empty" }, status: 400
      end
    end
end
