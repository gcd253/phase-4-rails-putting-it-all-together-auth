class UsersController < ApplicationController

    def create
        user = User.create!(new_user_params)
        session[:user_id] = user.id
        render json: user, status: :created
    end

    def show
        user = User.find_by(id: session[:user_id])
        if session[:user_id]
            render json: user, except: :password_digest, status: :created
        else
            render json: { error: "Not authorized" }, status: :unauthorized
        end
    end

    private 

    def new_user_params
        params.permit(:username, :password, :password_confirmation, :bio, :image_url)
    end
end
