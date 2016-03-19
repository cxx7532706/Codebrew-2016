require 'json'

class PostsController < ApplicationController

  protect_from_forgery :secret => 'any_phrase', :except => :collect

	def index
    #include Paperclip::Glue
    @accepted = Post.where(status: 1)
    @newPosts = Post.where(status: 0)
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
    #@params = {'Username' => 'It is ethics. It is honor. -Emily Post', 
    #  'Password' => 'Submit'}
    #@x = Net::HTTP.post_form(URI.parse('https://go-get-it.herokuapp.com/collect'), @params)
    #render text: @x.body

    #connection.post("https://go-get-it.herokuapp.com/collect", );
  end

  def new
    @post = Post.new
  end

  def create
    expir = DateTime.new(params[:post]["expir(1i)"].to_i, params[:post]["expir(2i)"].to_i, params[:post]["expir(3i)"].to_i, params[:post]["expir(4i)"].to_i, params[:post]["expir(5i)"].to_i)
    available_time_start = DateTime.new(params[:post]["available_time_start(1i)"].to_i, params[:post]["available_time_start(2i)"].to_i, params[:post]["available_time_start(3i)"].to_i, params[:post]["available_time_start(4i)"].to_i, params[:post]["available_time_start(5i)"].to_i)
    available_time_end = DateTime.new(params[:post]["available_time_end(1i)"].to_i, params[:post]["available_time_end(2i)"].to_i, params[:post]["available_time_end(3i)"].to_i, params[:post]["available_time_end(4i)"].to_i, params[:post]["available_time_end(5i)"].to_i)

    @post = Post.new(post_params)
    @post.update(status: 0)
    @post.update(expir: expir)
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
    params.require(:post).permit(:item, :description, :quantity, :loc, :super, :org)
  end
end
