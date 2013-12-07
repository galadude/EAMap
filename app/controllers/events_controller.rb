class EventsController < ApplicationController
	def new
	end

	def show
		@event = Event.find(params[:id])
	end

	def edit
		@event = Event.find(params[:id])
	end

	def destroy
		@event = Event.find(params[:id])
		@event.destroy
		redirect_to events_path
	end

	def update
  		@event = Event.find(params[:id])
		if @event.update(params[:event].permit(
			:name, :location, :description, :organisation, :latitude, :longitude
		))
    		redirect_to @event
  		else
    		render 'edit'
  		end	
  	end

	def index
		@events = Event.all
	end

	def create 
		@event = Event.new(params.require(:event).permit(
		:name, :location, :description, :organisation, :latitude, :longitude
		))

		@event.save
		redirect_to @event
	end 
end
