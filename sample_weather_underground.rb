require 'open-uri'
require 'json'
open('http://api.wunderground.com/api/26c5e04f41912327/geolookup/conditions/q/90210.json') do |f|
  json_string = f.read
  parsed_json = JSON.parse(json_string)
  location = parsed_json['location']['city']
  temp_f = parsed_json['current_observation']['temp_f']
  print "Current temperature in #{location} is: #{temp_f}\n"
end