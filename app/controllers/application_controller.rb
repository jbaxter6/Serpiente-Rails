class ApplicationController < ActionController::API
    before_action :logged_in?

    def encode_token(payload)
        JWT.encode(payload, "DC060120", "HS256")
    end

    def logged_in?
        headers = request.headers["Authorization"]
        token = headers.split(" ")[1]

        begin
            user_id = JWT.decode(token, "DC060120", "HS256")[0]["user_id"]
            user = User.find(user_id)
        rescue 
            user = nil
        end
        render json: {error: "Please log in"} unless user
    end

    def find_user
      headers = request.headers["Authorization"]
      token = headers.split(" ")[1]

      user_id = JWT.decode(token, "DC060120", "HS256")[0]["user_id"]      
      return  User.find(user_id)
    end
end
