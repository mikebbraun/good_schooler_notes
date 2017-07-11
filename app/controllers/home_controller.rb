class HomeController < ApplicationController
  def index
    # session[:school] = nil
    # session[:database] = nil
    # session[:bruh?] = nil
    # reset_session
    # render json: session
    # aka puts session.to_json
    # message = nil
    # if session[:id] == 1
    #   message = 'logged in'
    # else
    #   message = 'logged out'
    # end
    @message = if session[:id] == 1
        "logged in"
      else
        "logged out"
      end
    # render plain: message
  end

  def login
    #assuming authentication
    session[:id] = 1
    # render plain: 'logged you in'
    redirect_back(fallback_location: home_path)
  end

  def logout
    # session.delete :id
    # render plain: 'logged you out'
    reset_session
    redirect_back(fallback_location: home_path)
  end

  def post
    render json: params
  end

  def get
    # @user = User.find_by(name: params[:username])
    render json: params
  end
end
