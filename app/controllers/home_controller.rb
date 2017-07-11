class HomeController < ApplicationController
  def index
    # session[:school] = nil
    # session[:database] = nil
    # session[:bruh?] = nil
    # reset_session
    # render json: session
    # aka puts session.to_json

    if session[:id] == 1
      message = 'logged in'
    else
      message = 'logged out'
    end
    
  end

  def post
    render json: params
  end

  def get
    # @user = User.find_by(name: params[:username])
    render json: params
  end
end
