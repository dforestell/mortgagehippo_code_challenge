class Transaction < ActiveRecord::Base
	belongs_to :user

	validates :type, presence: true
	validates :coin_type, presence: true

end