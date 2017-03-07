# This program is for training my OOP.

# Take an array of hashes containing info about cars and their passengers,
# and then output the info on each car and each passenger using OOP.

# 1. The Passenger class should have each person's info such as their name and age.

# 2. The Car class should hold a list of Passengers, be able to load/unload passengers.

# 3. The Garage class should hold a list of Cars, much like the Car class holds Passengers.

# 4. Each class should be able to return info about what it contains:
	# => the Passenger class should be able to display name and age of each passenger.
	# => the Car class should have a method which displays the name and age of each passenger.
	# => the Garage class should be able to display the name and number of seats of each car.

# 5. Practice calling methods on classes via other classes that hold them. (For example, instead of calling '.info'
# directly on an instance of the Passenger class, call it indirectly through the Car class or Garage class by getting
# that class to return a Person object and then calling the '.info' method on that Person.)



class Passenger
	attr_reader :name, :age

	def initialize(name, age)
		@name = name
		@age = age
	end

	def info
		puts "#{@name}: #{@age} years old"
	end
end



class Car
	attr_reader :name, :current_passengers

	def initialize(name, number_of_seats)
		@name = name
		@number_of_seats = number_of_seats
		@current_passengers = []
	end


	def info
		puts "#{@name}: #{@number_of_seats} seats available"
	end


	def load_passengers(passenger_group)
		@passenger_group = passenger_group

		if @passenger_group.length <= @number_of_seats
			@passenger_group.each do |name, age|
				@current_passengers << Passenger.new(name, age)
				puts "#{name} has entered the #{@name}."
				@number_of_seats -= 1 
			end
		else
			puts "The car doesn't have enough room."
		end
	end


	def unload_a_passenger
		if @current_passengers != []
			puts "#{@current_passengers.pop.name} has exited the #{@name}."
			@number_of_seats += 1
		else
			puts "The car is already empty."
		end
	end


	def unload_all_passengers
		@current_passengers = []
	end


	def passengers_info
		puts "Info about current passengers:"
		@current_passengers.each do |passenger|
			passenger.info
		end
	end
end



class Garage
	attr_accessor :cars_in_garage

	def initialize(cars_info)
		@cars_in_garage = []
		cars_info.each do |car|
			car.each do |name, number_of_seats|
				@cars_in_garage << Car.new(name, number_of_seats)
			end
		end
	end

	def info
		@cars_in_garage.each do |car|
			car.info
		end
	end
end





cars_info = [
	{"Honda Volkswagen" => 4},
	{"Subaru Miata" => 3},
	{"Ford Prius" => 5},
	{"Actualize Tour Bus" => 8} 
]

passenger_groups = [
	{"Demario" => 25, "Monica" => 23, "Olga" => 30},
	{"Eddie" => 30, "James" => 24, "Zach" => 24},
	{"Ken" => 23, "Jody" => 25},
	{"Danish" => 26, "O'Hoon" => 25, "Andrew" => 25, "Michelle" => 25}
]





garage = Garage.new(cars_info)

garage.info

garage.cars_in_garage.each do |car|
	car.load_passengers(passenger_groups.shuffle.pop) # this said pop(1) before, and my program would output full passenger
																										# hashes, and nil
																										# for passengers and age, respectively. when I changed it to
																										# just pop, it fixed the issue. why?
	#car.passengers_info
	car.unload_a_passenger
	garage.info
	car.passengers_info
end

#Predict the output of each of the following lines, or if there will be any output to the screen.

test1 = Passenger.new("Zach", 24)

test1.info

puts test1.name
puts test1.age

test2 = Car.new("Car name", 5)

test2.info
test2.load_passengers(passenger_groups[0])
test2.unload_a_passenger
test2.info
test2.passengers_info
test2.unload_all_passengers
test2.info

test3 = Garage.new(cars_info)
test3.info

puts test3.cars_in_garage.pop.info # I want this to return info on the last car in the array @cars_in_garage
