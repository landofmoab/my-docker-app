class User < ApplicationRecord
  before_create :generate_jti
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  include Devise::JWT::RevocationStrategies::JTIMatcher

  validates :first_name, presence: true
  enum :gender, { male: "male", female: "female" }, default: :male
  validates :email, presence: true

  private

def generate_jti
  self.jti ||= SecureRandom.uuid
end
end