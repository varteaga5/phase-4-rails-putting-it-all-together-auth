class RecipesController < ApplicationController
    # returns a list of all the recipes
    def index
            recipes = Recipe.all
            render json: recipes
    end

    def create
        # we can call '.recipes' on the current user because of the associations
        new_recipe = @current_user.recipes.create!(recipe_params)
        render json: new_recipe, status: :created
    end
    
end
# FIND OUT HOW .recipes is able to be called on user.

