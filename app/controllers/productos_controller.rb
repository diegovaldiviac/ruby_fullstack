
class ProductosController < ApplicationController

    before_action :require_user, only: [:index_for_bucket]
    
  
    def index_for_bucket
      @bucket = Bucket.find(params[:id])
      @productos = @bucket.productos
    end
  end
  