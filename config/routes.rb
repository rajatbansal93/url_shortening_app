Rails.application.routes.draw do
  post :short_url, action: :create, controller: 'short_urls'
end
