class RelationshipsController < ApplicationController

    def followed
        @user = User.find(params[:user_id])
        
    end

    def follower
        @user = User.find(params[:user_id])
    end

    def create
        current_user.follow(params[:user_id])
        redirect_to request.referer
    end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

end
