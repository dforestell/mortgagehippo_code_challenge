class UsersController < ApplicationController
	def create
		@key = SecureRandom.hex(10)
		@user =User.create(api_key: @key)
		render json: @user, status: :ok
	end
end