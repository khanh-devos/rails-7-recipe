class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all.order('created_at')
  end
end