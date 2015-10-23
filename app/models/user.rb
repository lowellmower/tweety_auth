class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  devise :omniauthable, :omniauth_providers => [:twitter]

  # find or create new user based on UID && provider
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email

      # user.name = auth.info.name   => if user model has username
      # user.image = auth.info.image => if user model has image
    end
  end

  # new user based off saved session info
  def self.new_with_session(params, session)
    if session['devise.user_attributes']
      new(session['devise.user_attributes'], without_protection: true) do |user|
        user.attributes = params
        user.valid?
      end
    else
      # fallback to normal devise behavior to create new user instnace
      super
    end
  end

  # boolean for email field in form
  def email_required?
    super && email.blank?
  end

  # boolean for password field in form
  # def password_required?
  #   super && provider.blank?
  # end

  # allow update with blank password field
  def update_with_password(params, *options)
    if encrypted_password.blank?
      update_attributes(params, *options)
    else
      super
    end
  end

end
