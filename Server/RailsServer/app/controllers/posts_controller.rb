require 'json'

class PostsController < ApplicationController

  protect_from_forgery :secret => 'any_phrase',
  :except => :collect

	def index
    #include Paperclip::Glue

    @posts = Post.all
	end

  def show
    #include Paperclip::Glue

    @post = Post.find(params[:id])
  end

  def collect
    render text: 1
    #puts request.headers

    #@username = request.headers["Username"]
    #@password = request.headers["Password"]

    #render text: 1

    #render "data received";
  end

  def testpost
    @params = {'box1' => 'It is ethics. It is honor. -Emily Post', 
      'button1' => 'Submit'}
    @x = Net::HTTP.post_form(URI.parse('https://go-get-it.herokuapp.com/collect'), params)
    puts @x.body

    #connection.post("https://go-get-it.herokuapp.com/collect", );
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
