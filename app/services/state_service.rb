class StateService

	def updateStates(event)
		State.all.map { |state|
			RulesEngineService.updateState(state, event)
		}
  end
end