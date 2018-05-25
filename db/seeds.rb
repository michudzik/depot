# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Products
Product.create!(title: 'Seven mobile apps in seven weeks',
	description:
	%{<p>
			<em>
				First book
			</em>
			First description
		</p>},
	image_url: '7apps.jpg',
	price: 26.00)

Product.create!(title: 'Ruby performance optimization',
	description:
	%{<p>
			<em>
				Second book
			</em>
			Second description
		</p>},
	image_url: 'adrpo.jpg',
	price: 20.00)

Product.create!(title: 'Rails, Angular, Postgres and Bootstrap',
	description:
	%{<p>
			<em>
				Third book
			</em>
			Third book
		</p>},
	image_url: 'dcbang.jpg',
	price: 15.00)
