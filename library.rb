class Library
	attr_accessor :reader_name, :book, :order_date, :issue_date
	def initialize(reader_name, book, order_date, issue_date)
		@reader_name = reader_name
		@book = book
		@order_date = order_date
		@issue_date = issue_date
	end

    class << self
		def unsatisfied_orders(arr)
			@count = 0
			arr.each {|val| @count+= 1 if val.issue_date.nil?}
			puts "#{@count} orders were not satisfied"
		end

#		def fastest_find(arr)
#			@count = 0
#			arr.each {|val| @count+= 1 if val.value > 10}
#			puts "#{@count} parcels with value > 10 were sent"
#		end

		def who_takes_often(arr, book)
			@count = 0
			@i = 0
			arr.each_with_index do |val, index|
				if val.book == book
				@temp_match = val.reader_name
					while @i != index && @i < arr.length
						if arr[@i].reader_name == @temp_match
							@match = arr[@i].reader_name
						end
						@i+= 1
					end
				end
			end
			if @match.empty?
				puts "#{@temp_match} often takes '#{book}'" 
				else puts "#{@match} often takes '#{book}'"
			end
		end

		def popular_book(arr)
			@count = 0
			@i = 0
			arr.each_with_index do |val, index|
			@temp_match = val.book
				while @i != index && @i < arr.length
					if arr[@i].book == @temp_match
						@match = arr[@i].book
					end
					@i+= 1
				end
			end
			puts "The most popular book is '#{@match}'"
		end

#		def one_of_three(arr)
#			@count = 0
#			@i = 0
#			@match = Array.new
#			arr.each_with_index do |val, index|
#			@temp_match = val.book
#				while @i != index && @i < arr.length
#					if arr[@i].book == @temp_match
#						while @i < 2
#							@match[@i] = arr[@i].book
#						end
#					end
#					@i+= 1
#				end
#			end
#			puts "#{@count} people ordered #{@match}"
#		end
 	end

end

	data = Array.new
	data[0] = Library.new("Ivan", "LOTR: The Fellowship of the Ring", "12.12.2012", nil)
	data[1] = Library.new("Vasya", "War and Peace: part 1", "02.02.2002", "03.02.2002")
	data[2] = Library.new("Ivan", "The Witcher", "13.12.2010", "15.12.2010")
	data[3] = Library.new("Igor", "The Hunger Games", "29.12.2012", nil)
	data[4] = Library.new("Ivan", "The Witcher", "13.11.2010", "15.11.2010")
	data[5] = Library.new("Vladimir", "The Witcher", "05.12.2010", "06.12.2010")
	data[6] = Library.new("Igor", "War and Peace: part 2", "13.12.2010", "15.12.2010")
	
	Library.unsatisfied_orders(data)
	Library.popular_book(data)
	Library.who_takes_often(data, "The Witcher")