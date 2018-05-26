require 'rules_engine_service'

class StateService

	def self.updateStates(event)
		State.all.map { |state|
			response = RulesEngineService.updateState(state.status, event)
			state.status = response
			state.save!
		}
  end

end