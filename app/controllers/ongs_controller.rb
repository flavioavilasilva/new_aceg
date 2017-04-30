class OngsController < ApplicationController

  def index
    if params[:city]
      @city = params[:city]
      @ongs = Ong.where(city: @city)
    else
      @ongs = Ong.all
    end
  end

  def show
    @ong = Ong.find params[:id]
    @adoptions = @ong.adoptions.where(status: 0)
  end

end
