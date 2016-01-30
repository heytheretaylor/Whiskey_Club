class PostsController < ApplicationController
	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)
		@post.user = current_user
		

		if @post.save
			flash[:notice] = "Posted!"
			redirect_to posts_path(@post)
		else
			flash[:notice] = "Post failed!"
			logger.debug("There was an error!!!")
		end
	end

	def index
		@posts = Post.all
		@new_post = Post.new
	end

	def show
		@post = Post.find(params[:id])
	end

	private
	def post_params
		params.require(:post).permit(:content)
	end
end
