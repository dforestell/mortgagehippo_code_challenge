class ApplicationController < ActionController::API
	rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  	def record_not_found
    	render json: {status: "error", code: 400, message: "I cannot locate that resourse"}
  	end
end
