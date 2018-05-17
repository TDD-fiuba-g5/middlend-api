class EventsController < ApiController

	StateService stateService = StateService.new

	def show
		 event = Event.find(params[:id])
		 render :json => event
	end

	def create
		event = Event.create!(event_params)
		stateService.updateStates(event)
		render :json => event
	end

	def event_params
    params.require(:event).permit(:event_type, :ticket_id)
  end
end
