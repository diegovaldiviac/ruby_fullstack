
class ProductosController < ApplicationController
    before_action :find_bucket
    before_action :find_producto, only: [:edit, :update, :destroy]
    before_action :require_user
    before_action :require_editor_or_admin, only: [:edit]
    before_action :require_admin, only: [:destroy]

    def find_bucket
      @bucket = Bucket.find(params[:bucket_id])
    end
  
    def find_producto
      @producto = @bucket.productos.find(params[:id])
    end
    

    def new
      @producto = @bucket.productos.build
    end
    
    def create
      @producto = @bucket.productos.build(producto_params)
      if @producto.save
        redirect_to productos_bucket_path(@bucket), notice: "Producto was successfully created."
      else
        if @producto.errors[:required_field].include?("can't be blank")
          flash.now[:alert] = "Please fill in all required fields."
        end
        render :new
      end
    end
    

    def edit
      #@producto = Producto.find(params[:id])
    end
  
    def update
      if @producto.update(producto_params)
        redirect_to productos_bucket_path(@bucket), notice: "Producto was successfully updated."
      else
        render :edit
      end
    end
  
    def destroy
      if @producto.destroy
        redirect_to productos_bucket_path(@producto.bucket_id), alert: "Producto was successfully deleted."
      else
        render :edit, alert: "Failed to delete"
      end
    end


  
    private
    def producto_params
      params.require(:producto).permit(:name, :price, :status)
    end
end
  