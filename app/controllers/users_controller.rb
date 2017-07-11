class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def search
    x = params["thethingyousearchfor"]
    user = User.find_by(name: x)
    redirect_to user
  end

  # GET /users
  # GET /users.json
  def index
    @users = User.all
    # render strings
    # render plain: ';alksdjf'
    # render inline: "<%= Time.now %>"

    # render 'home/index'
    # render controller: 'home', acton: 'index'
    # DEFAULT render 'index'

    # rendering randome files
    # render file: '/Users/michaelbraun/Wyncode/server/public/hello.html'

    # render API responses
    @user = User.take
    # render plain: @user.to_json
    # render json: User.all
    # render xml: @user

    # rendering with optional layout
    # render layout: false

    #rendering with custom layout
    # render layout: 'simple'

    #render with custom status
    # render plain: "client error", status: 400
    # render plain: "client error", status: :bad_request

    # double render
    # render(:index) and return
    # render json: User.take
    # api_response = true
    #
    # if api_response
    #   render json: User.take
    # else
    #   render :index
    # end
    #
    # if api_response
    #   render json: User.take and return
    # end
    # render :index
    # redirect_to '/users/new'
    # redirect_to 'http://www.google.com'

    # url helpers
    # redirect_to home_path
    # redirect_back(fallback_location: 'users_new')

    # head
    # head :no_content
    # head 204
    # head :server_error
    # head 404
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    # render (json: params) and return

    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :active)
    end
end
