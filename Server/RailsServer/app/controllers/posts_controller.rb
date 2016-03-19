class PostsController < ApplicationController

	def index
    #include Paperclip::Glue

    @posts = Post.all
	end

  def show
    #include Paperclip::Glue

    @post = Post.find(params[:id])
  end

  def new
    
  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end
end
