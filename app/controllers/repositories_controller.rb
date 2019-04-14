class RepositoriesController < ApplicationController

  def index
    resp = Faraday.get("https://api.github.com/user") do |req|
      req.params['oauth_token'] = session[:token]
    end
    body = JSON.parse(resp.body)
    @username = body
  end

end
