class Drift < ActiveRecord::Base
	require 'rest_client'
	#28.677031,77.501339 (lat,long)
	before_create :upda
	def upda
		kEY = 'AIzaSyAoGt7dvW1JJDnIkP7ghQbLn6V6imd3eW4'
	  	rADIUS = '500'
	  	tYPES = 'atm'
	  	iNVALID_REQUEST = {"error": "Something wrong happend!"}
	  	mAPS_URL = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json'
		loc=self.latitude.to_s + ',' + self.longitude.to_s
		url="#{mAPS_URL}?location=#{loc}&radius=#{rADIUS}&types=#{tYPES}&key=#{kEY}"
		#url=mAPS_URL+"?location"+loc+rADIUS+tYPES+kEY
		res = RestClient::Resource.new(url)
		us = res.get
		self.content=JSON.parse(us, :symbolize_names => true)#us#self.latitude.to_s + ',' + self.longitude.to_s#self.latitude#JSON.parse(us, :symbolize_names => true)
	end	
end
