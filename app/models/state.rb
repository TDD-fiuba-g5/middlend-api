class State < ApplicationRecord

  validates :rule, presence: true


	def parseStatus statusToParse
		self.status = statusToParse[8..statusToParse.length-2]
	end

	
end
