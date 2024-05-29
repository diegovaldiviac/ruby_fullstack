class BucketsController < ApplicationController

    before_action :require_user, only: [:index, :show]

    def index
        @buckets = Bucket.all
    end

    def show
        @bucket = Bucket.find(params[:id])
        @productos = @bucket.productos
    end
end