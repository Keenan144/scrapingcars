


class Viewer
attr_reader :budget, :type_of_car
	def initialize
		@budget
		@type_of_car
	end

	def welcome
		puts "~~~~~~Welcome To~~~~~~" 
		sleep (0.8)
		puts "~~~~Scraping Cars~~~~~"
		sleep (0.8)
		clearscreen
		puts "An interactive command line app"
		sleep (0.8)
		puts "Created by: "
		sleep (0.8)
		
		developers
	end

	def good_bye
		puts 'Thank you for using our app'
		puts 'We hope we have helped you decide on a new car.'

	end

	def loading
		3.times do 
			clearscreen
			loading_icon
		end
		clearscreen
	end

	def loading_icon
		5.times do print "."
			sleep (0.1)
		end

	end

	def clearscreen
		system "clear"
	end

	def developers
		developers = ['Keenan Sturtevant', 'Walter Zimmerman', 'Maurits Moeys', 'Nichole Shelton']
		developers.each do |name|
			puts name
			sleep (0.7)
		end
		loading
	end

	def what_type_of_car
		puts "What type of car are you looking for: "
		puts "Sedan, Wagon, Crossover, Luxury, Coupe, SUV, Hybrid, Pick-Up"
		@type_of_car = gets.chomp
		2.times do loading_icon
		end
		clearscreen
		how_much_money
	end



	def how_much_money
		puts "How much money do you have to spend on this car?"
		@budget = gets.chomp
		
	end

	def no_matches
		puts "We are sorry, but no cars in our database match your search."
	end

	def matches
		puts "our database query goes here"
	end

	def show_options
		puts "Here are the cars in your range: "
		 
			if @type_of_car.downcase == "sedan" 
				no_matches
			elsif @type_of_car.downcase == "wagon" 
				no_matches
			elsif @type_of_car.downcase == "crossover" 
				no_matches
			elsif @type_of_car.downcase == "Luxury" || @budget.to_i > 70_000
				matches
			elsif @type_of_car.downcase == "coupe" 
				no_matches
			elsif @type_of_car.downcase == "suv" 
				no_matches
			elsif @type_of_car.downcase == "hybrid" 
				no_matches
			elsif @type_of_car.downcase == "pick-up" 
				no_matches	
			else 
				no_matches
				
		end
	end
end



#______driver__code_______#



test = Viewer.new

test.welcome
test.what_type_of_car
test.show_options





