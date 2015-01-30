require_realtive "view/view_methods"



class Core_controller


	def boot_up
		start_scraping
		populate_database
		get user input
	end

	def list_queried_cars
		cars = luxury_cars.all
	end


	def boot_down
		shut_down
	end



end



app = Core_controller.new

app.boot_up
app.list_queried_cars
app.boot_down