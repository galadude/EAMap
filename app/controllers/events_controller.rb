class EventsController < ApplicationController
	def new
	end

	def create 
		@event = Event.new(params.require(:event).permit(
		:name, :location, :description, :organisation, :latitude, :longitude
		))

		@event.save
		redirect_to @event
	end 
end
