class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :identities

  def self.from_omniauth(auth, current_user)
    identity = Identity.find_with_omniauth(auth)
    if identity.present? && !current_user.present?
      identity.user
    elsif !identity.present? && current_user.present?
      create_new_identity(auth, current_user)
    else
      create_user(auth)
    end
  end

  def self.new_with_session(params, session)
    if session["devise.user_attributes"]
      new(session["devise.user_attributes"], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      super
    end
  end

  def password_required?
    super && provider.blank?
  end

  def update_with_password(params, *options)
    encrypted_password.blank? ? update_attributes(params, *options) : super
  end

  private

  def self.create_new_identity(auth, current_user)
    current_user.identities << Identity.create(uid: auth.uid, provider: auth.provider)
    current_user.save!
    current_user
  end

  def self.create_user(auth)
    identity = Identity.create(uid: auth.uid, provider: auth.provider)
    user = where(email: auth.info.email).first_or_create do |user|
      user.email = auth.info.email
      user.provider = auth.provider
      user.uid = auth.uid
    end
    identity.user = user
    identity.save!
    user
  end
end
