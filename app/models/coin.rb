class Coin < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true 
	validates :value, presence: true
	validates :quantity, presence: true

	def self.get_value
		coins = Coin.all
		sum = 0
		coins.each do |coin| 
			coin_total = coin.value * coin.quantity
			sum += coin_total
		end
		sum
	end
end