class RepositoriesController < ApplicationController
  
  def index
    resp = Faraday.get("https://api.github.com/user") do |req|
      req.params['oauth_token'] = session[:token]
    end

    @username = JSON.parse(resp.body)["response"]["login"]
  end

end
