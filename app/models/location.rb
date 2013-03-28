require 'httparty'

class Location < ActiveRecord::Base
   attr_accessible :city, :state, :zip, :lat, :lon
   attr_accessor :temp_f
  
   def AddGeoLookup (zip)
     response = HTTParty.get("http://api.wunderground.com/api/26c5e04f41912327/geolookup/conditions/q/#{zip}.json")
     @location = Location.new()
     @location.city = response['location']['city']
     @location.state = response['location']['state']
     @location.zip = zip
     @location.lat = response['location']['lat']
     @location.lon = response['location']['lon']
     @location.save
   end
   
   def GetTemp (zip)
     response = HTTParty.get("http://api.wunderground.com/api/26c5e04f41912327/geolookup/conditions/q/#{zip}.json")
     temp_f = response['current_observation']['temp_f']
     return temp_f
   end
end
