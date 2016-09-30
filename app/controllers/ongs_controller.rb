class OngsController < ApplicationController
  def show
    @ong = Ong.find params[:id]
  end
end
