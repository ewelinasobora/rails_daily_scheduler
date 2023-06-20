# frozen_string_literal: true

class EventsController < ApplicationController
  def index
    @events = Event.where(status: params[:status].presence || 'incomplete')
  end

  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update(event_params)
        format.turbo_stream
        format.html { redirect_to todo_url(@event), notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  def toggle
    @event = Event.find(params[:id])
    @event.update(status: 'complete')

    render json: { message: 'Success' }
  end

  private

  def event_params
    params.require(:event).permit(:text, :status)
  end
end
