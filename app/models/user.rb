class User < ActiveRecord::Base
	validates :api_key, presence: true

	has_many :transactions
end