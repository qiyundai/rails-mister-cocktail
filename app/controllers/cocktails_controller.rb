class CocktailsController < ApplicationController
before_action :set_cocktail, only: [:show]

    def index
        @cocktails = Cocktail.all
    end

    def new
        @cocktail = Cocktail.new
    end

    def create
        @cocktail = Cocktail.new(strong_params)
        if @cocktail.save
            redirect_to cocktail_path(@cocktail)
        else
            render :new
        end
    end

    def show
        @doses = @cocktail.doses.map do |dose|
            {
                ingredient: Ingredient.find(dose.ingredient_id)[:name],
                description: dose.description
            }
        end
    end

    private
    def set_cocktail
        @cocktail = Cocktail.find(params[:id])
    end

    def strong_params
        params.require(:cocktail).permit(:name)
    end
end
