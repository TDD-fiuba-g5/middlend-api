require 'rest-client'

class RulesEngineService

	@@uri = "http://5022dc49.ngrok.io"

	def self.initializeRulesEngine rule
  	url = @@uri + "/initializer"
  	payload = { rules: rule }.to_json
	  response = RestClient.post(url, payload, headers=getDefaultHeaders())
	  puts response.to_str
	  response
  end

  def self.updateState(status, event)
  	url = @@uri + "/processor"
  	payload = { state: status, data: event.data }.to_json
  	response = RestClient.post(url, payload, headers=getDefaultHeaders())
  	response
  end

  def self.getCounter(status, counterName, counterParams)
  	url = @@uri + "/query-counter"
  	payload = {state: status, counterName: counterName, counterParams: counterParams}.to_json
  	response = RestClient.post(url, payload, headers=getDefaultHeaders())
  end


  def self.getDefaultHeaders
  	{"Content-Type": "application/json"}
  end

end