class RepositoriesController < ApplicationController

  def index
    resp = Faraday.get("https://api.github.com/user") do |req|
      req.params['access_token'] = ENV['ACCESS_TOKEN']
    end
    body = JSON.parse(resp.body)
    @username = body["login"]
    @token = ENV['ACCESS_TOKEN']
  end

end
