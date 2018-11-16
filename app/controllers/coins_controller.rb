class CoinsController < ApplicationController

	def index
		@coins = Coin.all
		p @coins
		render json: @coins, status: :ok
	end

end