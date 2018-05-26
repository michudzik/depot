require 'test_helper'

class ProductTest < ActiveSupport::TestCase
	# Specify which fitures to load
	fixtures :products

	def setup
		@product = products(:ruby)
	end

	test "product attributes should not be empty" do
		product = Product.new
		assert product.invalid?
		assert product.errors[:title].any?
		assert product.errors[:description].any?
		assert product.errors[:image_url].any?
		assert product.errors[:price].any?
	end

	test "product should be valid" do
		assert @product.valid?
	end

	test "title should be present" do
		@product.title = "    "
		assert @product.invalid?
	end

	test "description should be present" do
		@product.description = "    "
		assert @product.invalid?
	end

	test "image url should be present" do
		@product.image_url = nil
		assert @product.invalid?
	end

	test "price should not be negative" do
		@product.price = -0.01
		assert @product.invalid?
	end

	test "price should not be zero" do
		@product.price = 0.00
		assert @product.invalid?
	end

	test "price should be valid" do
		@product.price = 0.01
		assert @product.valid?
		assert @product.errors[:price].empty?
	end

	test "title should be unique" do
		product = Product.new(title: @product.title,
													description: 'description',
													image_url: 'whatever.jpg',
													price: 30.00)
		assert product.invalid?
	end

	test "image_url should be valid" do
		valid = %w{ fred.jpg fred.gif fred.png
							  FRED.JPG Fred.jpg
							  http://a.b.c/x/y/z/fred.gif }

		valid.each do |image|
			@product.image_url = image
			assert @product.valid?
			assert @product.errors[:image_url].empty?
		end
	end

	test "image_url should be invalid" do
		invalid = %w{ fred.doc fred.gif/more fred.gif.more }

		invalid.each do |image|
			@product.image_url = image
			assert @product.invalid?
		end
	end

end
