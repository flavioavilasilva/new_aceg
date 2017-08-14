class PetsController < ApplicationController
  before_action :load_constants, only: [:new, :create, :edit, :index]
  before_action :authenticate_ong!, only: [:new]
  def index
      @pets = Pet.joins(ong: :address).where(available: true)
      @pets = @pets.city(params[:city]) if params[:city].present?
      @pets = @pets.type(params[:pet_type]) if params[:pet_type].present?
      @pets = @pets.gender(params[:gender]) if params[:gender].present?
      @pets = @pets.size_pet(params[:size]) if params[:size].present?
  end

  def new
    fill_ong
    @pet = @ong.pets.build
    @pet.age = Age.new
  end

  def edit
    fill_ong
    fill_pet
  end

  def create
    fill_ong
    @pet = @ong.pets.new(pets_params)
    @pet.age = params[:pet][:age]
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
    @pet.age = params[:pet][:age]
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
    @pet_presenter = PetPresenter.new(@pet)
    @adoption = Adoption.new
  end

  private

  def load_constants
    @sizes = Size::SIZES
    @pet_types = PetType::TYPES
    @genders = Gender::GENDERS
    @cities = Address.distinct.pluck(:city)
  end

  def fill_ong
    @ong = Ong.find(params[:ong_id])
  end

  def fill_pet
    @pet = Pet.find(params[:id])
  end

  def pets_params
    params.require(:pet).permit(:name, :size, :pet_type, :breed, :gender,
                                :vaccined, :deficiency, :castrated,
                                :description,:avatar, :photos, :available, [age_attributes: [:scala, :age]])
  end
end
