class OmniauthCallbacksController <  Devise::OmniauthCallbacksController
	
	def facebook
    generic_callback('facebook')
  end

  def google_oauth2
    generic_callback('google_oauth2')
  end
 
  def generic_callback(provider)
    omniauth = request.env['omniauth.auth']
    @user = User.from_omniauth(omniauth)
    if @user.save
      set_flash_message(:notice, :success, kind: provider.capitalize) if is_navigational_format?
      sign_in_and_redirect @user, event: :authentication
    else
      session['omniauth'] = omniauth.except('extra')
      redirect_to new_user_registration_url
    end
  end
end
