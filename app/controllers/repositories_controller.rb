class RepositoriesController < ApplicationController

  def index
    resp = Faraday.get("https://api.github.com/user") do |req|
      req.params['access_token'] = session[:token]
      req.headers['Accept'] = 'application/json'
    end
    body = JSON.parse(resp.body)
    @username = body[:login]
    @token = session[:token]
  end

end
