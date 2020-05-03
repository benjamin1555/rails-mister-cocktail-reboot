class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
    @first_cocktail = Cocktail.first
  end

  def show
  end

  def new
  end

  def create
  end
end
