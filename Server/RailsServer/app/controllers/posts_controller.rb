require 'json'

class PostsController < ApplicationController

  protect_from_forgery :secret => 'any_phrase', :except => :collect,:except => :modifyStatus,:except => :getPickUpList, :except => :modifyStatusAgain

	def index
    #include Paperclip::Glue

    @posts = Post.all
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

  def testpost
    @params = {'Username' => 'It is ethics. It is honor. -Emily Post', 
      'Password' => 'Submit'}
    @x = Net::HTTP.post_form(URI.parse('https://go-get-it.herokuapp.com/collect'), @params)
    #render text: @x.body

    #connection.post("https://go-get-it.herokuapp.com/collect", );
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(params[:post])
  end

  def edit

  end

  def update

  end

  def destroy

  end
end
