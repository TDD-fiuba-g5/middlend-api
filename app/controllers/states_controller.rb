require 'rules_engine_service'
class StatesController < ApiController

	def index
		states = State.all
		render :json => states
	end

	def show
		 state = State.find(params[:id])
		 render :json => state
	end

	def create
		state = State.create!(state_params)
		RulesEngineService.initializeRulesEngine state.rule
		render :json => state
	end

	def destroy
		state = State.find(params[:id])
		state.destroy!
		render :json => state
	end

	def state_params
    params.require(:state).permit(:name, :rule, :status)
  end
end
