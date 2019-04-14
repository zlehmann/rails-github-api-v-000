class RepositoriesController < ApplicationController

  def index
    resp = Faraday.get("https://api.github.com/user") do |req|
      req.params['access_token'] = session[:token]
      req.headers['Authorization'] = session[:token]
    end
    body = JSON.parse(resp.body)
    @username = body
  end

end
