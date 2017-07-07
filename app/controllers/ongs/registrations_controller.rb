class Ongs::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  def new
    build_resource({})
    @geolocation = session[:geolocation]
    self.resource.address = Address.new
    respond_with self.resource
  end

  protected

  def after_sign_up_path_for(resource)
    ong_path resource
  end

  def after_update_path_for(resource)
    ong_path(resource)
  end

  private

  def sign_up_params
    allow = [:facebook_url, :avatar, :cnpj, :email, :password, :password_confirmation, :name, :phone, :contact, :pet_capacity, :site, :description, [address_attributes: [:postal_code, :address_number, :state, :city, :address, :neighborhood]] ]
    params.require(:ong).permit(allow)
  end
end
