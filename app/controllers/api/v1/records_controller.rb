class Api::V1::RecordsController < ApplicationController
  def create
    headers = request.headers["Authorization"]
    token = headers.split(" ")[1]

    begin
        user_id = JWT.decode(token, "DC060120", "HS256")[0]["user_id"]
        user = User.find(user_id)
    rescue 
        user = nil
    end

    user.records.build(record_params)
    
    message = {success: false}
    if !user
      message[:error] = "User not logged in"
    elsif !user.valid?
      message[:error] = "Record data not valid"
    else
      user.save
      message[:success] = true
    end
    render json: message
  end
  private
  def record_params
    params.require(:record).permit(:score)
  end  
end
