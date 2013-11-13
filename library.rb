class Library
	@books = [] #book = {title: ""}

	def initialize(books=[])
		@books = books
		@orders = []
	end

  def order(reader_name, book_title)
		finded_book = nil
		@books.each do |book|
			if book[:title] == book_title
				finded_book = true 
      if finded_book 
    	issue_date = Time.now + rand(200..500000)
    	else
    		nil
    	end
		order = { reader_name: reader_name, book_title: book_title, order_date: Time.now, issue_date: issue_date, reader_name: reader_name}
		@orders << order 
	  end 
  end

	def unsatisfied_orders
		count = 0
		@orders.each {|order| count+= 1 if order[:issue_date].nil?}
		puts "#{count} orders were not satisfied"
	end

	def fastest_find
		count = 0
		periods = []
		@orders.each do |order|
			periods << Time.at(order[:issue_date]-order[:order_date]).strftime("%d days") unless order[:issue_date].nil?
		end
		periods.sort {|x,y| y <=> x}
		puts "Shortest period is: #{periods[0]}"
	end

	def who_takes_often(book_title)
		i = 0
		match = ''
		@orders.each_with_index do |order, index|
			if order[:book_title] == book_title
				temp_match = order[:reader_name]
				while i != index && i < @orders.length
					if @orders[i][:reader_name] == temp_match
						match = @orders[i][:reader_name]
					end
					i+= 1
				end
			end
		end
		if match.empty?
			puts "#{book_title} is nobody's favourite book"
		else
			puts "#{match} often takes #{book_title}"
		end
	end

	def one_of_three
		index3 = 0
		books_popularity = []
		readers = []
		i = 0
		match = ''
		@books.each do |book|
			popularity = 0
			@orders.each do |order|
				popularity += 1 if order[:book_title] == book[:book_title]
				reader_name = order[:reader_name]					
			end
			books_popularity << { book_title: book[:title], popularity: popularity}
		end 
		books_popularity.sort_by 
		books_popularity.each_with_index do |book, index|
			unless index > 2
					@orders.each_with_index do |order, index2|
				 		if order[:book_title] == book[:book_title]
		 	 	 	  end
		 	 	 	end
		 	end
	  end
			puts "#{readers.uniq} often takes "
	end

	def popular_book
		books_popularity = []
		reader_name = []
		@books.each do |book|
			popularity = 0
			@orders.each do |order|
				popularity += 1 if order[:book_title] == book[:title]						
			end
			books_popularity << { book_title: book[:title], popularity: popularity}
		end 
		books_popularity.sort_by 
		puts "The most popular book is '#{books_popularity[0][:book_title]}'"
		puts books_popularity
	end

end
end

	library = Library.new([{title:"The Hunger Games"}, {title: "War and Peace: part 1"}, {title: "LOTR: The Fellowship of the Ring"}, {title: "The Witcher"}])
	library.order("Ivan", "LOTR: The Fellowship of the Ring")
	library.order("Vasya", "War and Peace: part 1")
	library.order("Alexandr", "War and Peace: part 1")
	library.order("Nina", "War and Peace: part 1")
	library.order("Igor", "The Hunger Games")
	library.order("Sergei", "The Hunger Games")
	library.order("Ivan", "The Hunger Games")
	library.order("Olya", "The Hunger Games")
	library.order("Fedor", "The Hunger Games")
	library.order("Fedor", "The Hunger Games")
	library.order("Igor", "The Witcher")
	
	library.unsatisfied_orders()
	library.fastest_find()
	library.popular_book()
	library.who_takes_often("The Hunger Games")
	library.one_of_three