class DosesController < ApplicationController
  before_action :set_cocktail, only: [:new, :create, :edit, :update]
  before_action :set_dose, only: [:edit, :update]
  before_action :set_review, only: [:create, :update]

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to @cocktail
    else
      render 'cocktails/show'
    end
  end

  def edit
  end

  def update
    if @dose.update(dose_params)
      redirect_to @cocktail
    else
      render 'edit'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def set_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def set_dose
    @dose = Dose.find(params[:id])
  end

  def set_review
    @review = Review.new
  end
end
