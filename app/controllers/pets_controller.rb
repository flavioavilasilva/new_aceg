class PetsController < ApplicationController
  before_action :load_constants, only: [:new, :create]
  before_action :authenticate_ong!, only: [:new]
  def index
    if params[:city]
      @city = params[:city]
      @pets = Pet.joins(ong: :address).where(addresses: { city: params[:city] })
    else
      @pets = Pet.all
    end
  end

  def new
    fill_ong
    @pet = @ong.pets.build
  end

  def create
    fill_ong
    @pet = @ong.pets.new(pets_params)
    @pet.photos = params[:photos]
    if @pet.save
      redirect_to @pet
    else
      flash[:error] = 'Campos com (*) são obrigatórios'
      render :new
    end
  end

  def update
    fill_pet
    @pet.photos = params[:photos]
    if @pet.update pets_params
      redirect_to @pet
    else
      flash[:error] = 'Campos com (*) são obrigatórios'
      render :edit
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

  def fill_pet
    @pet = Pet.find(params[:id])
  end

  def pets_params
    params.require(:pet).permit(:name, :age, :size, :pet_type, :breed, :gender,
                                :vaccined, :deficiency, :castrated,
                                :description,:avatar, :photos, :available)
  end
end
