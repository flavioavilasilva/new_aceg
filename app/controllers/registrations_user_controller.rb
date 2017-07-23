class RegistrationsUserController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  def new
    build_resource({})
    binding.pry
    self.resource.address = Address.new
    respond_with self.resource
  end

  protected

  def after_update_path_for(resource)
    user_profile_path(resource)
  end

  private

  def sign_up_params
    allow = [:facebook_url, :avatar, :email, :password, :password_confirmation, :name, :phone, [address_attributes: [:postal_code, :state, :city, :address, :address_number, :neighborhood]] ]
    params.require(resource_name).permit(allow)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:facebook_url, :avatar, :cnpj, :email, :password, :password_confirmation, :name, :phone, [address_attributes: [:postal_code, :address_number, :state, :city, :address, :neighborhood]] ) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:current_password, :facebook_url, :avatar, :cnpj, :email, :password, :password_confirmation, :name, :phone, [address_attributes: [:postal_code, :address_number, :state, :city, :address, :neighborhood]] ) }
  end
end
