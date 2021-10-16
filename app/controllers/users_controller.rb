class UsersController < ApplicationController
    # this skips the before action 
    skip_before_action :authorize, only: :create
    # Sign up feature
    def create
        user = User.create!(user_params)
        # if the user is valid:
        if user.valid?
            # Save a new user to the database with their username, encrypted password, image URL, and bio
            # Save the user's ID in the session hash
            session[:user_id] = user.id
            # Return a JSON response with the user's ID, username, image URL, and bio; and an HTTP status code of 201 (Created)
            render json: user, status: :created
        else
            render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
        end
    end
    # Auto Login Feature
    def show
        # if the user is logged in (if their user_id is in the session hash):
        render json: @current_user
    end

    private

    def user_params
        params.permit(:username, :password, :password_confirmation, :image_url, :bio )
    end

end

# In the show action, 
# Return a JSON response with the user's ID, username, image URL, and bio; and an HTTP status code of 201 (Created)
# If the user is not logged in when they make the request:
# Return a JSON response with an error message, and a status of 401 (Unauthorized)

# In the create action, 
# if the user is valid:
# Save a new user to the database with their username, encrypted password, image URL, and bio
# If the user is not valid:
# Return a JSON response with the error message, and an HTTP status code of 422 (Unprocessable Entity)