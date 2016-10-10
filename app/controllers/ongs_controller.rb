class OngsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :my_ongs]

  def my_ongs
    @my_ong = current_user.ongs.first
    @adoptions = @my_ong.adoptions.where(status: 0)
  end

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
  end

  def new
    @ong = Ong.new
  end

  def create
    @ong = current_user.ongs.create(ong_params)
    if @ong.save
      redirect_to @ong
    else
      flash[:error] = 'Campos com (*) são obrigatórios'
      render :new
    end
  end

  private

  def ong_params
    params.require(:ong).permit(:cnpj, :name, :street, :number, :neighborhood,
                                :zipcode, :state, :city, :email, :phone,
                                :contact, :acept_pets, :site, :avatar)
  end
end
