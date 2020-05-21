class UsersController < ApplicationController
  
  before_action :authenticate_user!, only: [:show, :new, :index, :edit]
  def show
     @user = User.find(params[:id])
     @books = @user.books
     @book = Book.new
  end
  
  def index
  	@users = User.all
  	user = current_user
    @book = Book.new
  end

  def edit
      @user = User.find(params[:id])
      redirect_to user_path(current_user) unless @user.id == current_user.id
  end

def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to @user,notice: "You have updated user successfully."
  else
    render "edit"
  end
  end

private

  def user_params
   params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
