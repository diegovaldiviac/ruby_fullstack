class BucketsController < ApplicationController

    before_action :require_user, only: [:index, :show]
    #before_action :require_editor, only: [:edit]
    #before_action :require_admin, only: [:edit, :destroy]

    def index
        @buckets = Bucket.all
    end

    def show
        @bucket = Bucket.find(params[:id])
        @productos = @bucket.productos
    end
end