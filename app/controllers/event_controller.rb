class EventController < ApplicationController

  def get
    events = Event.all

    render :json => events.map {|event| {
      :id => event.id,
      :start_date => event.start_date.to_formatted_s(:db),
      :end_date => event.end_date.to_formatted_s(:db),
      :text => event.text
    }}
  end

  def add
    event = Event.create!(
      text: params["text"],
      start_date: params["start_date"],
      end_date: params["end_date"],
      user: current_user
    )

    render :json=>{:action => "inserted", :tid => event.id}
  end

  def update
    event = Event.find(params["id"])
    event.text = params["text"]
    event.start_date = params["start_date"]
    event.end_date = params["end_date"]
    event.save!

    render :json=>{:action => "updated"}
  end

  def delete
    Event.find(params["id"]).destroy

    render :json=>{:action => "deleted"}
  end
end
