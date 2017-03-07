# Take an array of numbers and filter out all numbers that are greater than 6.

# Example:
# Input: [1, 3, 5, 9, 11, 13]
# Output: [1, 3, 5]

numbers = [1, 3, 5, 9, 11, 13]
output = []

numbers.each do |number|
	if number <= 6
		output << number
	end
end

puts output