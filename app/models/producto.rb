class Producto < ApplicationRecord

    belongs_to :bucket, foreign_key: 'bucket_id'
    validates :name, length: {minimum: 2}
end
