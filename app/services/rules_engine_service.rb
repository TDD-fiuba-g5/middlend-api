require 'rest-client'

class RulesEngineService

	@@uri = "http://localhost:3000"

	def self.initializeRulesEngine rule
  	url = @@uri + "/states"
  	#url = @@uri + "/initializer"
  	payload = { rules: rule }
	  #RestClient.post(url, payload, headers=getDefaultHeaders())
	  RestClient.get(url, headers=getDefaultHeaders())
  end

  def self.updateState(status, data)
  	url = @@uri + "/data"
  	payload = { status: status, data: data }
  	RestClient.get(url, payload, headers=getDefaultHeaders())
  end


  def self.getDefaultHeaders
  	{content: "application/json"}
  end

end