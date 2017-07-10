class OngsController < ApplicationController
  before_action :load_constants, only: [:index]

  def index
    @ongs = Ong.joins(:address).where nil
    @ongs = @ongs.city(params['/ongs']['city']) if params['/ongs'] && params['/ongs']['city'].present?
    @ongs = @ongs.starts_with(params['/ongs']['name']) if params['/ongs'] && params['/ongs']['name'].present?
  end

  def show
    @ong = Ong.find params[:id]
    @adoptions = @ong.adoptions.where(status: 0, ong: @ong.id)
  end

  private

  def load_constants
    @cities = Address.distinct.pluck(:city)
  end
end
