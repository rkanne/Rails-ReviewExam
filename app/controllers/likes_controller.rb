class LikesController < ApplicationController
	before_action :require_login, only: [:index, :destroy]
	# before_action :require_correct_user, only: [:index, :destroy]

 	def index
	    @secret = Secret.where(user: params[:id])
		like = Like.create(user_id: session[:user_id], secret_id: params[:secret_id])		
		redirect_to '/secrets'

	end
	def destroy
		destroy = Like.where(user_id: session[:user_id]).where(secret_id: params[:secret_id])
		if !destroy
			flash[:errors] = "You cannot unlike that"
		else
			destroy.destroy_all
		end
		
		redirect_to '/secrets'

	end
end