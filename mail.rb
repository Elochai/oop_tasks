class Mail
	attr_accessor :city, :street, :house, :apartment, :destination, :value

	def initialize 
		@orders = []
	end

	def parcel(city, street, house, apartment, value)
		order = {city: city, street: street, house: house, apartment: apartment, value: Integer(value), destination: String("City: " + city + ", street: " + street + ", house: " + house + ", ap: " + apartment)}
		@orders << order
	end 

		def parcels_for_city(city)
			count = 0
			@orders.each {|val| count+= 1 if val[:city] == city}
			puts "#{count} parcels were sent to #{city} city"
		end

		def parcels_with_value_higher_than(value)
			count = 0
			@orders.each {|val| count+= 1 if val[:value] > value}
			puts "#{count} parcels with value > #{value} were sent"
		end

		def most_popular_address
			i = 0
			match = ''
			@orders.each_with_index do |val, index|
			temp_match = val[:destination]
				while i != index && i < @orders.length
					if @orders[i][:destination] == temp_match
						match = @orders[i][:destination]
					end
					i+= 1
				end
			end
			if match.empty?
				puts "There is no popular address"
				else puts "Most popular address: #{match}"
			end
		end

end

	order = Mail.new
	order.parcel("Dnepr", "Glinki st.", "2", "11", 13)
	order.parcel("Dnepr", "Glinki st.", "2", "14", 2)
	order.parcel("Dnepr", "Glinki st.", "3", "15", 15)
	order.parcel("Kiyv", "Kirova st.", "5", "15", 10)
	order.parcel("Kiyv", "Lenina st.", "3", "25", 8)
	order.parcel("Kiyv", "Kirova st.", "5", "15", 19)
	order.parcel("Kiyv", "Kirova st.", "5", "15", 18)
	order.parcel("Kiyv", "Kirova st.", "5", "15", 18)
	order.parcel("Kiyv", "Kirova st.", "1", "11", 12)

	order.parcels_for_city("Dnepr")
	order.parcels_with_value_higher_than(10)
	order.most_popular_address()
