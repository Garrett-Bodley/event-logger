class EventsController < ApplicationController

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(parse_log(event_params[:log_txt]))
    if @event.save
      redirect_to @event
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
    @comment = Comment.new(event: @event)
  rescue ActiveRecord::RecordNotFound
    redirect_to events_path, alert: "Event with ID of #{params[:id]} does not exist!"
  end

  def index
    @events = Event.all
  end

  def destroy
    begin
      @event = Event.find(params[:id])
      @event.destroy
    rescue => e
      binding.pry
      redirect_to events_path, alert: 'Record could not be found'
    end
    redirect_to events_path, notice: 'Record deleted!'
  end

  private

  def parse_log(text)
    src = text.match(/\ssrc=(\S*)\s/)[1]
    src_is_valid = IPAddress.valid_ip?(src)
    src_is_private = src_is_valid ? IPAddress(src).private? : false

    dst = text.match(/\sdst=(\S*)\s/)[1]
    dst_is_valid = IPAddress.valid_ip?(dst)
    dst_is_private = dst_is_valid ? IPAddress(dst).private? : false

    {
      src: src,
      src_is_valid: src_is_valid,
      src_is_private: src_is_private,
      dst: dst,
      dst_is_valid: dst_is_valid,
      dst_is_private: dst_is_private,
      log_txt: text
    }
  rescue NoMethodError
    false
  end

  def event_params
    params.require(:event).permit(:log_txt)
  end
end
