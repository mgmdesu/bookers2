class UsersController < ApplicationController
  #Usersの一覧ページ
  def index
    @users = User.all
  end
  
  #Home=Usersのshowページ
  def show
    @user = User.find(params[:id])
    
    @books = @user.books
  end

  #プロフィール編集ページ
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end
  
  private
  
  def user_params
    params.require(:user).permit(:title, :profile_image, :body)
  end 
end
