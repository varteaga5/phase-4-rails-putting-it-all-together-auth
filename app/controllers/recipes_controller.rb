class RecipesController < ApplicationController
    # returns a list of all the recipes
    def index
            recipes = Recipe.all
            render json: recipes
    end

    def create
        # we can call '.recipes' on the current user because of the associations coded in the recipes serializer: "has_one :user"
        new_recipe = @current_user.recipes.create!(recipe_params)
        render json: new_recipe, status: :created
    end

    private
    # use of stron params prevents of user from unwanted changes to attributes
    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete)
      end
    
end

