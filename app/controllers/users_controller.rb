class UsersController < ApplicationController
  # list users
  before_action :authenticate_user!
  def index
    #@user = User.find(params[:id])
    @user = current_user
    @users = User.all
    @post_book = Book.new
    @books = Book.all
  end

  def edit
    @user = current_user
    @user_a = User.find(params[:id])
    if @user_a.id != current_user.id
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = 'You have updated user successfully.'
      #@user = current_user
      # @users = User.all
      #@post_book = Book.new
      redirect_to user_path(current_user.id)
    else
      render action: :edit
    end
  end

  def show
  	@user = User.find(params[:id])
    @post_book = Book.new
    @books = Book.where(user_id: @user.id)
  end

  private
  def user_params
  	params.require(:user).permit(:name, :introduction, :profile_image)
  end
end
