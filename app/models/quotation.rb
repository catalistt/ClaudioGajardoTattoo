class Quotation < ApplicationRecord
  belongs_to :user
  has_one_attached :tattoo_image
  has_one_attached :body_image
end
