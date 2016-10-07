class EventsController < ApplicationController
  def show
    @event = Event.find(params[:id])
  end

  def new
    fill_ong
    if current_user != @ong.user
      flash[:error] = 'Vocẽ não pode cadastrar eventos para esta ONG'
      redirect_to @ong
    else
      @event = @ong.events.build(ong: @ong)
    end
  end

  def create
    fill_ong
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

  private

  def fill_ong
    @ong = Ong.find(params[:ong_id])
  end
end
