class OngsController < ApplicationController
  def show
    @ong = Ong.find params[:id]
  end

  def index
    @ongs = Ong.all
  end
end
