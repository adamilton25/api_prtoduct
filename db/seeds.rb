
235.times do 
	Product.find_or_create_by(
		name: Faker::Restaurant.name.downcase, 
		description:Faker::Restaurant.description,
		quantity: rand(1..50),
		value: rand(1..500)
		)
end

puts "235 new products Created"

