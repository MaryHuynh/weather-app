require "yahoo_weatherman"

puts "What's your zipcode?"
location = gets.to_s

#function to go to Yahoo weather website for specific zipcode given by the user
def get_weather_page(location)
	client = Weatherman::Client.new
	weather_page = client.lookup_by_location(location)
end

#call get_weather_page function using the user zipcode and set the page info equal to the weather variable
weather = get_weather_page(location)

#create a loop with the each method to get every desired attribute from the forecasts method
weather.forecasts.each do|forecast|
	puts forecast["day"].to_s + " is going to be " + forecast["text"].downcase + " with a low of " + forecast["low"].to_s + " and a high of " + forecast["high"].to_s + " degrees Celsius."
end

