class AdoptionsController < ApplicationController

  def create
    pet = Pet.find(params[:pet_id])
    adoption = Adoption.new(pet: pet, user: current_user, status: 'Aberta')
    adoption.save
  end
end
