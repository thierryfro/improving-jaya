class Api::V1::EventsController < Api::V1::BaseController

  def index

    # add .where with params to filter events by issue number
    @events = Event.where(number: params[:number])

    render json: { events: @events.as_json }, status: 200
  end

  def create
    @event = Event.new

    @event.event_type = params[:hook][:type]
    @event.number = params[:hook][:id]
    @event.action = params[:hook][:events][0]

    if @event.save
      render json: { event: @event.as_json }, status: 200
    else
      render json: { errors: @event.errors.full_messages }, status: 422
    end
  end

end
