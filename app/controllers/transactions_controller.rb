class TransactionsController < ApplicationController
	before_action :authenticate!

	def index
		@transactions = Transaction.all
		render json: @transactions, status: :ok
	end

	def make_withdrawl
		@withdrawl = Transaction.new(transaction_type: "Withdrawl", coin_type: params[:coin_type], user_id: 1)
		@coin = Coin.find_by(name: params[:coin_type])
		if @coin.nil?
			render json: {status: "error", code: 4000, message: "Sorry but this machine does not deal with that type of coin currently"}
		
		else
			if @coin.quantity < 1
				render json: {status: "error", code: 4000, message: "Sorry but there are no #{params[:coin_type]}'s in the Machine Right Now"}
			else
				@coin.decrement!(:quantity)
				@withdrawl.save
				render json: @withdrawl, status: :ok
			end
		end

		NotifyAdmins.low_quantity(@coin).deliver if @coin.quantity < 4 
	end

	def make_deposit
		@deposit = Transaction.new(transaction_type: "Deposit", coin_type: params[:coin_type], user_id: 1)
		@coin = Coin.find_by(name: params[:coin_type])
		if @coin.nil?
			render json: {status: "error", code: 4000, message: "Sorry but this machine does not deal with that type of coin currently"}
		else
			@coin.increment!(:quantity)
			@deposit.save
			render json: @deposit, status: :ok
		end
	end


end 