require 'bluecloth'

class EventsController < ApplicationController
	before_filter :check_access, :only =>
		 [:new,:edit,:destroy,:update]
	
		 
	def new
		@event = Event.new
	end

	def show
		@event = Event.find(params[:id])
		@event.description = BlueCloth.new(@event.description).to_html
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
		@events.each  {
			|event|
			event.description = BlueCloth.new(event.description).to_html
		}
	end
	
	def list_as_json
		@events = Event.all
		@json_events = @events.to_json()
		render :json => @json_events
	end

	def map
		
	end
	
	def create 
		@event = Event.new(params.require(:event).permit(
		:name, :location, :description, :organisation, :latitude, :longitude
		))
		if @event.save 
			redirect_to @event
		else
			render 'new'
		end
	end 

	protected
	def check_access
		redirect_to events_path and return unless current_user.try(:admin?)
	end
end
