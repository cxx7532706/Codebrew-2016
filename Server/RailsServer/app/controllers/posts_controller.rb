require 'json'

class PostsController < ApplicationController

  protect_from_forgery :secret => 'any_phrase', :except => :collect

	def index
    #include Paperclip::Glue

    @posts = Post.all
	end

  def show
    #include Paperclip::Glue

    @post = Post.find(params[:id])
  end

  def collect
    puts request.headers

    @username = request.headers["Username"]
    @password = request.headers["Password"]

    render text: 1
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
