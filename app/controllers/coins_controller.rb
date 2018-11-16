class CoinsController < ApplicationController
	before_action :authenticate!

	def index
		@coins = Coin.all
		render json: @coins, status: :ok
	end

	def create
		@coin = Coin.new(coin_params)
		if @coin.save
			NotifyAdmins.send_coin_creation(@coin).deliver
			render json: @coin, status: :created
		else
			render json: {status: "error", code: 4000, message: "We Couldn't Create your coin, make sure coin name is unique and has the proper parameters"}
		end
	end

	def show
		@coin = Coin.find(params[:id])
		render json: @coin, status: :ok
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

	def value
		@sum = Coin.get_value
		render json: {value: @sum, status: "ok", code: 200, message: "Total Value of all existing coins is #{@sum}"}
	end
  
  private

  def coin_params
    params.permit(:name, :value)
  end
end
