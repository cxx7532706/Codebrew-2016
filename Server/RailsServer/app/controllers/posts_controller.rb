require 'json'

class PostsController < ApplicationController

  protect_from_forgery :secret => 'any_phrase', :except => :collect,:except => :modifyStatus,:except => :getPickUpList, :except => :modifyStatusAgain

  def confirm
    redirect_to :confirms
  end

  def confirms

    @posts = Post.all
  end

	def index
    #include Paperclip::Glue
    @posts = Post.all
    #@accepted = Post.where(status: 1)
    #@newPosts = Post.where(status: 0)
	end

  def show
    #include Paperclip::Glue

    @post = Post.find(params[:id])
  end

  def collect
    #puts request.headers

    #username = request.headers["Username"]
    #password = request.headers["Password"]

   # render text: 1
   puts request.headers

    username = request.headers["Username"]
    password = request.headers["Password"]

    users = User.all
    user_id = 'None'
    users.each do |user|
        if user.email == username && user.password == password
          if user.user_type == 'Charity'
            user_id = user.id.to_s
          end
        end
    end

    render text: user_id
  end

  def getPickUpList
    puts request.headers
    charity = request.headers["Charity"]

    #newposts = Post.where(org: charity).find_each
    newposts = Post.where(status: 1).where(org: charity).find_each

    respond_to do |format|
      format.json { render :json => newposts }
    end

  end

  def modifyStatus
    puts request.headers
    item = request.headers["Name"]
    provider = request.headers["Provider"]
    charity = request.headers["Charity"]

    posts = Post.all

    posts.each do |post|
      if post.item == item && post.super == provider
        post.org = charity
        post.status = 1
        post.save
      end
    end

    newposts = Post.where(status: 0).find_each

    respond_to do |format|
      format.json { render :json => newposts }
    end
  end

  def modifyStatusAgain
    puts request.headers
    item = request.headers["Name"]
    provider = request.headers["Provider"]
    charity = request.headers["Charity"]

    posts = Post.all

    posts.each do |post|
      if post.item == item && post.super == provider && post.org == charity
        post.status = 2
        post.save
      end
    end

    newposts = Post.where(status: 1).where(org: charity).find_each

    respond_to do |format|
      format.json { render :json => newposts }
    end

  end

  def new
    @post = Post.new
  end

  def create
    available_time_start = DateTime.new(params[:post]["available_time_start(1i)"].to_i, params[:post]["available_time_start(2i)"].to_i, params[:post]["available_time_start(3i)"].to_i, params[:post]["available_time_start(4i)"].to_i, params[:post]["available_time_start(5i)"].to_i)
    available_time_end = DateTime.new(params[:post]["available_time_end(1i)"].to_i, params[:post]["available_time_end(2i)"].to_i, params[:post]["available_time_end(3i)"].to_i, params[:post]["available_time_end(4i)"].to_i, params[:post]["available_time_end(5i)"].to_i)

    @currUser = UsersHelper.current_user

    puts @currUser.name
    puts @currUser.name
    puts @currUser.name

    @post = Post.new(post_params)
    @post.update(status: 0)
    @post.update(super: @currUser.name)
    @post.update(available_time_start: available_time_start)
    @post.update(available_time_end: available_time_end)

    if @post.save
      redirect_to posts_path#, :notice => 'Successfully uploaded'
    else
      render "new"
    end
  end

  def edit

  end

  def update

  end

  def destroy

  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def post_params
    params.require(:post).permit(:item, :description, :quantity, :loc, :expir)
  end
end
