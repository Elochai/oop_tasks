class Mail
	attr_accessor :city, :street, :house, :apartment, :destination, :value
	def initialize(city, street, house, apartment, value)
		@city = city
		@street = street
		@house = house
		@apartment = apartment
		@value = Integer(value)
		@destination = String("City: " + city + ", street: " + street + ", house: " + house + ", ap: " + apartment)
	end

    class << self
		def parcels_for_city(arr, city)
			@count = 0
			arr.each {|val| @count+= 1 if val.city == city}
			puts "#{@count} parcels were sent to #{city} city"
		end

		def parcels_with_value_higher_10(arr)
			@count = 0
			arr.each {|val| @count+= 1 if val.value > 10}
			puts "#{@count} parcels with value > 10 were sent"
		end

		def most_popular_address(arr)
			@count = 0
			@i = 0
			arr.each_with_index do |val, index|
			@temp_match = val.destination
				while @i != index && @i < arr.length
					if arr[@i].destination == @temp_match
						@match = arr[@i].destination
					end
					@i+= 1
				end
			end
			if @match.empty?
				puts "There is no populat address"
				else puts "Most popular address: #{@match}"
			end
		end
 	end

end

	data = Array.new
	data[0] = Mail.new("Dnepr", "Glinki st.", "2", "11", 13)
	data[1] = Mail.new("Dnepr", "Glinki st.", "2", "14", 2)
	data[2] = Mail.new("Dnepr", "Glinki st.", "3", "15", 15)
	data[3] = Mail.new("Kiyv", "Kirova st.", "5", "15", 10)
	data[4] = Mail.new("Kiyv", "Lenina st.", "3", "25", 8)
	data[5] = Mail.new("Kiyv", "Kirova st.", "5", "15", 19)
	data[6] = Mail.new("Kiyv", "Kirova st.", "5", "15", 18)
	data[7] = Mail.new("Kiyv", "Kirova st.", "5", "15", 18)
	data[8] = Mail.new("Kiyv", "Kirova st.", "1", "11", 12)

	Mail.parcels_for_city(data, "Dnepr")
	Mail.parcels_with_value_higher_10(data)
	Mail.most_popular_address(data)
