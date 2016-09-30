class PetsController < ApplicationController
  before_action :load_constants, only: [:new, :create]

  def new
    @pet = Pet.new
  end

  def create
    @pet = Pet.new(params.require(:pet).permit(:name, :age, :size, :pet_type,
                                               :breed, :gender, :vaccined,
                                               :deficiency, :castrated,
                                               :description, :avatar, :ong_id))
    if @pet.save
      redirect_to @pet
    else
      flash[:error] = 'Campos com (*) são obrigatórios'
      render :new
    end
  end

  def show
    @pet = Pet.find(params[:id])
  end

  private

  def load_constants
    @sizes = Size::SIZES
    @pet_types = PetType::TYPES
    @genders = Gender::GENDERS
  end
end
