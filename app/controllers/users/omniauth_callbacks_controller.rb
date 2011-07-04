class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def identica
    # You need to implement the method below in your model
    @user = User.find_for_statusnet_oauth(env["omniauth.auth"], current_user)

    if @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success", :kind => "Status.net"
      sign_in_and_redirect @user, :event => :authentication
    else
      session["devise.identica_data"] = env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
end