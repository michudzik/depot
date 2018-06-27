class Product < ApplicationRecord
  has_many :line_items
  has_many :orders, through: :line_items

  before_destroy :ensure_not_referenced_by_any_line_item

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
  validates :price, numericality: { greater_than_or_equal_to: 0.01,  }

  private

    # Ensure that not a single line item references that product
    def ensure_not_referenced_by_any_line_item
      unless line_items.empty?
        errors.add(:base, 'Line Items present')
        throw :abort
      end
    end
    
end

