require "rails_helper"

describe ShortUrlsController, type: :request do
  def do_create(params = {})
    post "short_url", params
  end

  describe 'POST create' do
    context 'when long url is not given' do
      it 'is expected to return 400' do
        do_create
        expect(response.status).to eq(400)
      end

      it 'is expected to message - Url cannot be empty' do
        do_create
        expect(JSON.parse(response.body)).to eq({ "error" => "Url cannot be empty" })
      end
    end

    context 'when given url is a bitly short url' do
      it 'is expected to return 400' do
        do_create(long_url: 'http://bit.ly/2Gwgzg4')
        expect(response.status).to eq(400)
      end

      it 'is expected to message - Something went wrong!!' do
        do_create(long_url: 'http://bit.ly/2Gwgzg4')
        expect(JSON.parse(response.body)).to eq({ "error" => "Something went wrong!!" })
      end
    end

    context 'when given is url is genuine' do
      it 'is expected to return 200' do
        do_create(long_url: 'https://www.youtube.com/watch?v=hVfBQNENS9s')
        expect(response.status).to eq(200)
      end
    end
  end
end
