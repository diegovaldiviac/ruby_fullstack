
class ProductosController < ApplicationController
    before_action :find_bucket
    before_action :find_producto, only: [:edit, :update, :destroy]
    before_action :require_user

    def find_bucket
      @bucket = Bucket.find(params[:bucket_id])
    end
  
    def find_producto
      @producto = @bucket.productos.find(params[:id])
    end
    
  
    def index
      @productos = @bucket.productos
    end

    def new
      @producto = @bucket.productos.build
    end
  
    def create
      @producto = @bucket.productos.build(producto_params)
      if @producto.save
        redirect_to bucket_productos_path(@bucket), notice: "Producto was successfully created."
      else
        render :new
      end
    end

    def edit
    end
  
    def update
      if @producto.update(producto_params)
        redirect_to bucket_productos_path(@bucket), notice: "Producto was successfully updated."
      else
        render :edit
      end
    end
  
    def destroy
      @producto.destroy
      redirect_to bucket_productos_path(@bucket), notice: "Producto was successfully deleted."
    end


  
    private
    def producto_params
      params.require(:producto).permit(:name, :price, :status) # Adjust attributes as needed
    end
end
  