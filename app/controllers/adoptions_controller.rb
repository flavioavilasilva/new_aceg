class AdoptionsController < ApplicationController

  def show
    @adoption = Adoption.find(params[:id])
  end

  def create
    pet = Pet.find(params[:pet_id])
    adoption = Adoption.new(pet: pet, user: current_user, status: 'Aberta')
    adoption.save
    redirect_to adoption
  end
end
