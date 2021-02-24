class CocktailsController < ApplicationController
before_action :set_cocktail, only: [:show, :edit, :update]

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
    end

    def edit
    end

    def update
        @cocktail.update(strong_params)
        redirect_to cocktail_path(@cocktail)
    end

    private
    def set_cocktail
        @cocktail = Cocktail.find(params[:id])
    end

    def strong_params
        params.require(:cocktail).permit(:name)
    end
end
