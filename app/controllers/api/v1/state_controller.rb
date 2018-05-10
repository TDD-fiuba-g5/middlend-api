module V1
	class StateController < Api::V1::ApiController

		def index
			states = State.all
		end

		def show

		end

	end
end
