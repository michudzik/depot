class Product < ApplicationRecord
  validates :title, presence: true
  validates :title,	uniqueness: true
  validates :title,	length: { minimum: 10 }
  validates :description, presence: true
  validates :image_url, presence: true
  #validates :image_url, allow_blank: true
  validates :image_url, format: {
                          with: 		%r{\.(png|jpg|gif)\Z}i,
                          message: 	'must be a URL for GIF, JPG or PNG image'
                        }
  validates :price, numericality: { greater_than_or_equal_to: 0.01 }
end

