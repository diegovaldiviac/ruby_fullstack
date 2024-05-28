class BucketsController < ApplicationController

    def index
        @buckets = Bucket.all
    end

    def show
        @bucket = Bucket.find(params[:id])
        @productos = @bucket.productos
    end
end