class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    parse_log(event_params[:log_txt])
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def parse_log(text)
    src = text.match(/\ssrc=(\S*)\s/)[1]
    dst = text.match(/\sdst=(\S*)\s/)[1]
    @event = Event.new(src: src, dst: dst, log_txt: text)
    binding.pry
  end

  def event_params
    params.require(:event).permit(:log_txt)
  end

end
