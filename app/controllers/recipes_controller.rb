class RecipesController < ApplicationController
    def create
        recipe = Recipe.create!(recipe_params)
        render json: recipe, status: :created
    end

    private

    def recipe_params
        params.permit(:title, :instructions, :minutes_to_complete, :user_id)
    end
end
