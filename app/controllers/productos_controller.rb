
class ProductosController < ApplicationController
    
  
    def index_for_bucket
      @bucket = Bucket.find(params[:id])
      @productos = @bucket.productos
    end
  end
  