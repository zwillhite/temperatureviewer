require 'httparty'
response = HTTParty.get('http://api.wunderground.com/api/26c5e04f41912327/geolookup/conditions/q/46205.json')

location = response['location']['city']
temp_f = response['current_observation']['temp_f']
  
print "Current temperature in #{location} is: #{temp_f}\n"