require 'state_service'

class EventsController < ApiController

	def show
		 event = Event.find(params[:id])
		 render :json => event
	end

	def create
		event = Event.create!(event_params)
		StateService.updateStates(event)
		render :json => event
	end

	def event_params
    params.require(:event).permit(:event_type, :ticket_id)
  end
end
