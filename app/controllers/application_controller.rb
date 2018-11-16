class ApplicationController < ActionController::API
	rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

  	def record_not_found
    	render json: {status: "error", code: 400, message: "I cannot locate that resourse"}
  	end

  	def valid_user?
  		user = User.find_by(api_key: params[:api_key])
  	end

  	def authenticate!
  		unless valid_user?
   			render json: {status: "Unauthorized", code: 400, message: "Please Register or provide a valid API Key"} 
    	end
	end
end
