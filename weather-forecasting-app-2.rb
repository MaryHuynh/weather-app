require "yahoo_weatherman"

puts "What's your zipcode?"
location = gets.to_s

#function to go to Yahoo weather website for specific zipcode given by the user
def get_weather_page(location)
	client = Weatherman::Client.new
	weather_page = client.lookup_by_location(location)
end

#function to convert temp from Celsius to Farenheit
def temp_converter(temp)
	temp = temp*1.8 + 32
	return temp.to_i
end

#call get_weather_page function using the user zipcode and set the page info equal to the weather variable
weather = get_weather_page(location)

#use strftime method to get the current week day as an integer
today = Time.now.strftime("%w").to_i

#create a loop with the each method to get every desired attribute from the forecasts method
#find out what the current day is as an integer
#compare the today variable as an integer to the day of the week as an integer
#if they are the same return dayName as "Today", if the result is today + 1 then return dayName as "Tomorrow", else return dayName as the full weekday name using strftime method and %A flag
weather.forecasts.each do|forecast|
	weekday = forecast["date"].strftime("%w").to_i
	if (weekday == today)
		dayName = "Today"
	elsif (weekday == today + 1)
		dayName = "Tomorrow"
	elsif (weekday == 0 && today + 1 == 7)
		dayName = "Tomorrow"
	else
		dayName = forecast["date"].strftime("%A")
	end
	
	low_temp = temp_converter(forecast["low"])
	high_temp = temp_converter(forecast["high"])
	
	#Farenheit output
	puts dayName + " is going to be " + forecast["text"].downcase + " with a low of #{low_temp}" + " and a high of #{high_temp}" + " degrees Farenheit."
	
	#Celsius output
	#puts dayName + " is going to be " + forecast["text"].downcase + " with a low of " + forecast["low"].to_s + " and a high of " + forecast["high"].to_s + " degrees Celsius."
end



