class Api::PostsController < ApplicationController

  def index
    #@posts = Post.all
	    
	@posts = Post.where(status: 0).find_each

    respond_to do |format|
      format.json { render :json => @posts }
    end
  end
end
