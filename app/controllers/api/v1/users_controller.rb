class Api::V1::UsersController < ApplicationController
    skip_before_action :logged_in?, only: [:create, :index, :show]

    def index
        users = User.all
        render :json => users
    end

    def show
        user = User.find(params[:id])
        render :json => {user: user, high_score: user.high_score}
    end

    def create
        # byebug
        user = User.new(user_params)
        if user.valid?
            user.save
            render json: {user: UserSerializer.new(user), token: encode_token({user_id: user.id})}
        else
            render json: {error: "Failed to create the user"}
        end
    end

    def find
      user = find_user

      render json: {user: user, high_score: user.high_score.score}
    end

    private

    def user_params
        params.permit(:username, :password)
    end
end
