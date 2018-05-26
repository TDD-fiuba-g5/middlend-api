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
		response = RulesEngineService.initializeRulesEngine state.rule
		state.status = response
		state.save!
		render :json => state
	end

	def getCounter
		state = State.find(params[:id])
		date = params[:date]
		if (!date) 
			date = Date.today.strftime("%Y-%m-%d")
		end
		response = RulesEngineService.getCounter state.status, "\"" + state.name + "\"", "[\"" + date + "\"]"
		render :json => response
	end

	def destroy
		state = State.find(params[:id])
		state.destroy!
		render :json => state
	end

	def state_params
    params.require(:state).permit(:name, :rule, :status, :value)
  end
end
