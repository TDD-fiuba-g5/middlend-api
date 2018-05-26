class Event < ApplicationRecord

	def data
		"{\"datetime\" : \"" + self.created_at.strftime("%Y-%m-%d %H:%M:%S") + "\", \"state\" : \"" + self.event_type + "\" }"
	end
end
