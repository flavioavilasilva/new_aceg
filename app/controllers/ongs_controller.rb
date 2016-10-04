class OngsController < ApplicationController
  def show
    @ong = Ong.find params[:id]
  end

  def new
    @ong = Ong.new
  end

  def create
    @ong = Ong.new(ong_params)
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
                                :contact, :acept_pets, :site)
  end
end
