class SessionsController < ApplicationController
    # the before action will skip the authorize function on the create method
    skip_before_action :authorize, only: :create
    # log in feature
    def create
        # in the sessions controller, a 'session' is created by finding a user by its username
        user = User.find_by(username: params[:username])
        # if the user's username and password are authenticated:
        # ".&" is used equally to 'user && user.authenticate(params[:password]).
        if user&.authenticate(params[:password])
            # Save the user's ID in the session hash
            session[:user_id] = user.id
            # Return a JSON response with the user's ID, username, image URL, and bio
            render json: user, status: :created
        else
            # If the user's username and password are not authenticated:
            # Return a JSON response with an error message, and a status of 401 (Unauthorized)
            render json: { errors: ["Invalid username or password"] }, status: :unauthorized
        end

    end
    # logout feature
    def destroy
        session.delete :user_id
        head :no_content
    end
end