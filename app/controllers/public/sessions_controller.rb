class Public::SessionsController < Devise::SessionsController
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :customer_state, only: [:create]


  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_in, keys: [:email, :password])
  end

  def customer_state
    @customer = Customer.find_by(email: params[:customer][:email])
  return if !@customer
    if @customer.valid_password?(params[:customer][:password])
      if @customer.is_active == true
         return if !@customer
      else
        redirect_to new_customer_registration_path
      end
    end
  end
end
