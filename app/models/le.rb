class Le < ApplicationRecord
  has_many :appointments
  has_many :clients, through: :appointments
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |le|
    le.provider = auth.provider
    le.uid = auth.uid
    le.email = auth.info.email
    le.password = Devise.friendly_token[0,20]
    end
  end
end
