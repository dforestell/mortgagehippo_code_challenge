class Coin < ActiveRecord::Base
	validates :name, presence: true, uniqueness: true 
	validates :value, presence: true
	validates :quantity, presence: true
end