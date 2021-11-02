class EventsController < ApplicationController

  def new
    @alert = alert
    @event ||= Event.new
  end

  def create
    @alert = alert
    @event = Event.new(parse_log(event_params[:log_txt]))
    if @event.save 
      redirect_to @event
    else
      render :new
    end
  end

  def show
    begin
      @event = Event.find(params[:id])
    rescue
      redirect_to new_event_path, alert: "Event with ID of #{params[:id]} does not exist!"
    end
  end

  def index
    @events = Event.all
  end

  private

  def parse_log(text)
    begin
      src = text.match(/\ssrc=(\S*)\s/)[1]
      dst = text.match(/\sdst=(\S*)\s/)[1]
      return { src: src, dst: dst, log_txt: text }
    rescue
      return false
    end
  end

  def event_params
    params.require(:event).permit(:log_txt)
  end

end
