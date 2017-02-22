class UsersController < ApplicationController
  before_action :require_login, only: [:edit]
  def index
  end

  def logout
    session.delete(:user)
    redirect_to '/'
  end

  def edit
    @user = User.find(session[:user])
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    if user.valid?
      user.save
      redirect_to '/events/index'
    else
      flash[:alert] = user.errors.full_messages
      redirect_to '/users/edit'
    end
  end

  def new
    user = User.new(user_params)
    if user.valid?
      user.save
      session[:user] = user.id
      redirect_to '/events/index'
    else
      flash[:alert] = user.errors.full_messages
      redirect_to '/'
    end
  end

  def check
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user] = user.id
      redirect_to '/events/index'
    else
      flash[:alert] = ["Invalid login"]
      redirect_to '/'
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :location, :state, :password, :password_confirmation)
  end
  def require_login
    redirect_to '/' unless session[:user]
  end
end
