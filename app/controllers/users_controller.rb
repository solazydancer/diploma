class UsersController < ApplicationController

	def index 
		@users = User.all 
	end

	def edit
  	end

  	def destroy
    @user.destroy
	end

end
