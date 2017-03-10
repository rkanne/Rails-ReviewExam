class SecretsController < ApplicationController
	before_action :require_login, only: [:index, :create, :destroy]
	def index
		@secret = Secret.all
		@like = Like.all
	end
	def create
		secret = Secret.create(content: params[:New_secret], user_id: session[:user_id])
       if secret.errors.any?
	        flash[:success] = secret.errors.full_messages
	        redirect_to "/users/#{secret.user_id}"
      else
	      	flash["success"] = "Secret created!" 
	        redirect_to "/users/#{secret.user_id}"
      end
	end
	def destroy
	    secret = Secret.find(params[:id])
	    secret.destroy if secret.user == current_user
	    redirect_to "/users/#{current_user.id}"
  	end
end
