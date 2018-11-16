class CoinsController < ApplicationController

	def index
		@coins = Coin.all
		p params
		render json: @coins, status: :ok
	end

	def create
		p params.name
	end

end