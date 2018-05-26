class Product < ApplicationRecord
	validates :title, 	presence: true,
						uniqueness: true,
						length: { minimum: 10 }

	validates :description, presence: true

	validates :image_url,	presence: true,
							#allow_blank: true,
							format: {
								with: 		%r{\.(png|jpg|gif)\Z}i,
								message: 	'must be a URL for GIF, JPG or PNG image'
							}

	validates :price,	numericality: { greater_than_or_equal_to: 0.01 }
end

