class Api::V1::EventsController < Api::V1::BaseController


  def index
    @events = Event.all

    render json: { events: @events.as_json }, status: 200
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      render json: { event: @event.as_json }, status: 200
    else
      render json: { errors: @event.errors.full_messages }, status: 422
    end
  end

  private

  def event_params
    params.require(:event).permit(:action, :event_type, :number)
  end
end
