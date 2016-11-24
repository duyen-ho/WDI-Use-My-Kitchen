class UsersController < ApplicationController
  layout "login_signup", only: [:new]

  def new
  end

  def create
    user = User.new
    user.email = params[:email]
    user.name = params[:name]
    user.password= params[:password]
    user.description = params[:description]
    user.photo_url = params[:photo_url]
    if user.save
      session[:user_id] = user.id
      redirect_to '/'

    else
      @errors = user.errors.messages
      render :new
    end

  end

  def show
    @user = User.find(params[:id])
  end



end
