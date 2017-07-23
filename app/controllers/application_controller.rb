class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :eventos

  def eventos
    @events = Event.where('datetime > :date', date: DateTime.now.in_time_zone)
                   .order(:datetime).limit(3)
  end
end
