class UsersController < ApplicationController

  before_action :setUser, only: [:edit, :update, :show, :destroy]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to Alpha Blog"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit

  end

  def update
    if @user.update(user_params)
      flash[:success] = "Succesfully updated your account"
      redirect_to user_path
    else
      render 'edit'
    end
  end

  def show

  end

  def destroy
    @user.destroy
    flash[:danger] = "Your account has been deleted"
    redirect_to users_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :password, :bio)
  end

  def setUser
    @user = User.find(params[:id])
  end

end