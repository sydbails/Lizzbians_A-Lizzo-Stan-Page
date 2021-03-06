class UsersController < ApplicationController
    
    def index
        users = User.all
    end
    
    def show
        user = User.find_by(id: params[:id])
        # user = User.find_by(username: session[:username])
        render json: user, include: [:games], except: [:password_digest, :updated_at, :created_at]
    end

    def new
    end

    def create
        user = User.create(user_params) 
        render json: {status: 'yay!' }
    end

    def user_params
        params.require(:user).permit(:username, :password_digest)
    end


end
