class ProductoController < ApplicationController

    before_action :require_user, only: [:index, :show]

    def index
        @producto = Producto.all
    end

    def show
        @producto = Producto.find(params[:id])
    end

end
