class CoinsController < ApplicationController

	def index
		@coins = Coin.all
		render json: @coins, status: :ok
	end

	def create
		@coin = Coin.new(coin_params)
		if @coin.save
			render json: @coin, status: :created
		else
			render json: {status: "error", code: 4000, message: "We Couldn't Create your coin, make sure coin name is unique"}
		end
	end

	def update
		@coin= Coin.find(params[:id])
		@coin.update(coin_params)
		render json: @coin, status: :updated
	end

	def destroy
		@coin= Coin.find(params[:id])
		@coin.destroy
	end

  
  private

  def coin_params
    params.permit(:name, :value)
  end
end
