class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(cocktail_params)

    @dose.cocktail = Cocktail.find(params[:cocktail_id])

    @dose.save

    redirect_to cocktail_path(Cocktail.find(params[:cocktail_id]))
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to cocktail_path(@dose.cocktail)
  end

private

  def cocktail_params
    params.require(:dose).permit(:description,:ingredient_id)
  end
end

