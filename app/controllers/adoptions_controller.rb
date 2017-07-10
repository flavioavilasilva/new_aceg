class AdoptionsController < ApplicationController
  before_action :valid_user

  def show
    @adoption = Adoption.find(params[:id])
  end

  def create
    pet = Pet.find(params[:pet_id])
    adoption = Adoption.new(pet: pet, user: current_user, ong: pet.ong,
                            status: 0)
    if adoption.save
      redirect_to adoption
    else
      flash[:error] = 'Ocorreu um erro no processo de adoção!'
      redirect_to pet
    end
  end

  def update
    @adoption = Adoption.find(params[:id])
    @adoption.update(adoption_params)

    redirect_to @adoption.ong
  end

  private

  def valid_user
    unless user_signed_in? || ong_signed_in?
      flash[:error] = 'É necessário estar logado!'
      redirect_to :new_user_session
    end
    true
  end

  def adoption_params
    params.require(:adoption).permit(:status)
  end
end
