module UserAuthenticationHelper

  def from_omniauth(auth, current_user)
    identity = Identity.find_with_omniauth(auth)
    if identity.present? && !current_user.present?
      # the user has logged in in the past using this method but it is not logged it right now
      identity.user
    elsif !identity.present? && current_user.present?
      # the user is logged in but has never used this method. He is linking accounts
      create_new_identity(auth, current_user)
    else
      create_user(auth)
    end
  end

  def new_with_session(params, session)
    if session['devise.user_attributes']
      new(session['devise.user_attributes'], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  private

  def create_new_identity(auth, current_user)
    current_user.identities << Identity.create(uid: auth.uid, provider: auth.provider)
    update_email_if_necessary(auth, current_user)
    current_user.save!
    current_user
  end

  def create_user(auth)
    identity = Identity.create(uid: auth.uid, provider: auth.provider)
    # this method ensures that if the user exists, then the accounts are linked and no user is
    # created
    user = where(email: auth.info.email).first_or_create do |aux_user|
      aux_user.email = auth.info.email
      aux_user.first_name = auth.info.first_name
      aux_user.last_name = auth.info.last_name
      aux_user.provider = auth.provider
      aux_user.uid = auth.uid
    end
    identity.user = user
    identity.save!
    user
  end

  def update_email_if_necessary(auth, current_user)
    if current_user.provider == 'twitter'
      current_user.email = auth.info.email
      current_user.provider = auth.provider
    end
  end
end
