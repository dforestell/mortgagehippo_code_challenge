class CoinsController < ApplicationController

	def index
		@coins = Coin.all
		p params
		render json: @coins, status: :ok
	end

	def create
		@coin = Coin.new(name: params[:name], value: params[:value])
		if @coin.save
			render json: @coin, status: :created
		else
			render json: {status: "error", code: 4000, message: "We Couldn't Create your coin, make sure coin name is unique"}
		end
	end

end