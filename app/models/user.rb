class User < ApplicationRecord
  require 'jwt'
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  max_paginates_per 2


  def generate_jwt
    JWT.encode({ id: self.id,
              exp: 60.days.from_now.to_i },
              Rails.application.secrets.secret_key_base)
  end

  def is_admin?
    self.is_admin
  end
end
