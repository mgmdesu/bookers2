class UsersController < ApplicationController
  #Usersの一覧ページ
  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end
  
  #Home=Usersのshowページ
  def show
    @user = User.find(params[:id])
    @books = @user.books
    @book = Book.new
    @user = current_user
  end

  #プロフィール編集ページ
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end 
end
