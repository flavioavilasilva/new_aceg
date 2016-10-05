class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
  end

  def new
    @ong = Ong.find(params[:ong_id])
    @event = @ong.events.build(ong: @ong)
  end

  def create
    @ong = Ong.find(params[:ong_id])
    @event = @ong.events.new(params.require(:event).permit(:ong_id,
                                                           :name, :address,
                                                           :datetime))

    if @event.save
      redirect_to @event
    else
      flash[:error] = 'Todos os campos com (*) são obrigatórios'
      render :new
    end
  end
end
