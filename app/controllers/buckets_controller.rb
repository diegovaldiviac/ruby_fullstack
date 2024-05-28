class BucketsController < ApplicationController

    before_action :require_user, only: [:index, :show]

    def index
        @buckets = Bucket.all
    end
end