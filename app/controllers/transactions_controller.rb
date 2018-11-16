class TransactionsController < ApplicationController
	def index
		@transactions = Transaction.all
		render json: @transactions, status: :ok
	end

	def make_withdrawl
		@withdrawl = Transaction.new(transaction_type: "Withdrawl", coin_type: params[:coin_type], user_id: 1)
		p params
		@coin = Coin.find_by(name: params[:coin_type])
		if @coin.quantity < 1 
			render json: {status: "error", code: 4000, message: "Sorry but there are no #{params[:coin_type]}'s in the Machine Right Now"}
		else
			@coin.decrement!(:quantity)
			@withdrawl.save
			render json: @withdrawl, status: :ok
		end

		# alert_admins if @coin.quantity < 4 



	end

	def make_deposit
	end


end 