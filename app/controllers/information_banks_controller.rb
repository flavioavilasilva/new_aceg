class InformationBanksController < ApplicationController
  def new
    @ong = Ong.find(params[:ong_id])
    @information_bank = InformationBank.new
  end

  def edit
    @ong = Ong.find(params[:ong_id])
    @information_bank = InformationBank.find(params[:id])
  end

  def create
    @information_bank = InformationBank.new(information_bank_params)
    @information_bank.save
  end

  def update
    @ong = Ong.find params[:ong_id]
    @information_bank = InformationBank.find(params[:id])
    if @information_bank.update information_bank_params
      redirect_to @ong
    else
      render :edit
    end

  end

  def information_bank_params
    params.require(:information_bank).permit(:ong_id, :cnpj, :agency, :bank, :account_number)
  end
end
