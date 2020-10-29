class UsersController < ApplicationController
  
  def my_portfolio
    @user = current_user
    @tracked_stocks = current_user.stocks
  end

  def my_friends
    @my_friendships = current_user.friends
  end

  def show
    @user = User.find(params[:id])
    @tracked_stocks = @user.stocks
  end

  def search
    if params[:friend].present?
      @friends = User.search(params[:friend])
      @friends = current_user.except_current_user(@friends)
      if !@friends.empty?
          respond_to do |format|
              format.js { render partial: 'friends/friends_result' }
          end
      else
          respond_to do |format|
              flash.now[:alert] = "Couldn't find user"
              format.js { render partial: 'friends/friends_result' }
          end
      end
      puts "*" * 100
      puts params[:friend]
    else
      respond_to do |format|
          flash.now[:alert] = "Please enter a friend name or email to search"
          format.js { render partial: 'friends/friends_result' }
      end
    end
  end

end
