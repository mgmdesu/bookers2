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
  end
end
