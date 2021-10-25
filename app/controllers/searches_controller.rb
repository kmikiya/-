class SearchesController < ApplicationController
  def search
    @user = User.search(params[:keyword])
  end
end

