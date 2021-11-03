class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to event_path(@comment.event), notice: 'Comment added'
    else
      @event = Event.find(comment_params[:event_id])
      render template: 'events/show'
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to @comment.event, updated_obj_id: @comment.id
    else
      render :edit
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    event = @comment.event
    @comment.destroy

    redirect_to event, notice: 'Comment successfully deleted'
  rescue ActiveRecord::RecordNotFound
    redirect_to events_path, alert: 'Record could not be found'
  end

  private

  def comment_params
    params.require(:comment).permit(:id, :name, :content, :event_id)
  end
end
