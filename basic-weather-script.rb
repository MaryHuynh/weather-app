require "yahoo_weatherman"

puts "What's your zipcode?"
location = gets.to_s

#use Yahoo's [Geoplanet] API to scrape the temperature and weather conditions at the zipcode given by the user. 
#The zipcode needs to be a string.
client = Weatherman::Client.new
weather_page = client.lookup_by_location(location)
temp = weather_page.condition["temp"].to_s
weather = weather_page.condition["text"].downcase

case(weather)
	when("sunny" || "mostly sunny")
		puts "It's " + temp + " degrees Celsius and sunny!"
	when("cloudy")
		puts "It's " + temp + " degrees Celsius and crazy cloudy!"
	when("partly cloudy")
		puts "It's " + temp + " degrees Celsius and kind of cloudy!"
	when("rainy")
		puts "It's " + temp + " degrees Celsius and crazy rainy!"
	when("snowy")
		puts "It's " + temp + " degrees Celsius and super snowy!"
	when("fair")
		puts "It's " + temp + " degrees Celsius and fair!"
	else
		puts("Sorry, not sure what the weather is currently. Be prepared for anything!")
end

puts "Currently, it is " + temp + " degrees Celsius." 
puts "Weather conditions are " + weather + "."

#puts weather_page.methods

#puts weather_page.forecasts

