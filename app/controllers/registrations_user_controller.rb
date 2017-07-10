class RegistrationsUserController < Devise::RegistrationsController

  def new
    build_resource({})
    self.resource.address = Address.new
    respond_with self.resource
  end

  protected

  def after_update_path_for(resource)
    user_profile_path(resource)
  end

  private

  def sign_up_params
    allow = [:email, :password, :password_confirmation, :name, :phone, [address_attributes: [:postal_code, :state, :city, :address, :address_number, :neighborhood]] ]
    params.require(resource_name).permit(allow)
  end
end
