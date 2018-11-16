class Transaction < ActiveRecord::Base
	belongs_to :user

	validates :transaction_type, presence: true
	validates :coin_type, presence: true

end