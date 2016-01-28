class WhiskeysController < ApplicationController
	def new
		@whiskey = Whiskey.new
	end

	def create
		@whiskey = Whiskey.new
		
		if @whiskey.save
			flash[:notice] = "whiskeyed!"
			redirect_to whiskey_path
		else
			flash[:notice] = "whiskey failed!"
			logger.debug("There was an error!!!")
		end
	end

	def index
		@whiskeys = Whiskey.all
		@new_whiskey = Whiskey.new
	end

	def show
		@whiskey = Whiskey.find(params[:id])
	end

	private
	def whiskey_params
		params.require(:whiskey).permit(:content)
	end
end