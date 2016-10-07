class AdoptionsController < ApplicationController

  def show
    @adoption = Adoption.find(params[:id])
  end

  def create
    pet = Pet.find(params[:pet_id])
    if user_signed_in?
      adoption = Adoption.new(pet: pet, user: current_user, status: 'Aberta')
      if adoption.save
        redirect_to adoption
      else
        flash[:error] = 'Ocorreu um erro no processo de adoção!'
        redirect_to pet
      end
    else
      flash[:error] = 'É necessário estar logado!'
      redirect_to pet
    end
  end
end
