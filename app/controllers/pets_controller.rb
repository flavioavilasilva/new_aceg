class PetsController < ApplicationController
  before_action :load_constants, only: [:new, :create]

  def index
    if params[:city]
      @city = params[:city]
      @pets = Pet.joins(:ong).where(ongs: { city: @city })
    else
      @pets = Pet.all
    end
  end

  def new
    fill_ong
    if current_user != @ong.user
      flash[:error] = 'Vocẽ não pode cadastrar Pets para esta ONG'
      redirect_to @ong
    else
      @pet = @ong.pets.build
    end
  end

  def create
    fill_ong
    @pet = @ong.pets.new(pets_params)
    if @pet.save
      redirect_to @pet
    else
      flash[:error] = 'Campos com (*) são obrigatórios'
      render :new
    end
  end

  def show
    @pet = Pet.find(params[:id])
    @adoption = Adoption.new
  end

  private

  def load_constants
    @sizes = Size::SIZES
    @pet_types = PetType::TYPES
    @genders = Gender::GENDERS
  end

  def fill_ong
    @ong = Ong.find(params[:ong_id])
  end

  def pets_params
    params.require(:pet).permit(:name, :age, :size, :pet_type, :breed, :gender,
                                :vaccined, :deficiency, :castrated,
                                :description, :avatar)
  end
end
