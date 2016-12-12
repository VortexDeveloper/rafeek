class User < ApplicationRecord
  has_one :account
  has_one :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
       :recoverable, :rememberable,
       :omniauthable, :omniauth_providers => [:facebook]

  enum group: [:admin, :user]

  validates :cpf, presence: true, uniqueness: true

  def self.from_omniauth(auth)
      user = where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
          user.email = auth.info.email
          user.password = Devise.friendly_token[0,20]
      end
      create_user_assets(user, auth)

      user
  end

  private
  def self.create_user_assets(user, auth)
    Profile.create!(
      user: user,
      name: auth.info.name,
      image: auth.info.image
    ) unless user.profile.present?
    Account.create!(user: user) unless user.account.present?
  end
end
