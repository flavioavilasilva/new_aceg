class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :eventos
  before_action :configure_permitted_parameters, if: :devise_controller?

  def eventos
    @events = Event.where('datetime > :date', date: DateTime.now.in_time_zone)
                   .order(:datetime).limit(3)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:facebook_url, :avatar, :cnpj, :email, :password, :password_confirmation, :name, :phone, :contact, :pet_capacity, :site, :description, [address_attributes: [:postal_code, :address_number, :state, :city, :address, :neighborhood]] ) }
    devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:current_password, :facebook_url, :avatar, :cnpj, :email, :password, :password_confirmation, :name, :phone, :contact, :pet_capacity, :site, :description, [address_attributes: [:postal_code, :address_number, :state, :city, :address, :neighborhood]] ) }
  end
end
