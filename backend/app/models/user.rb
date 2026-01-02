# frozen_string_literal: true

class User < ApplicationRecord
  # We removed the 'include' line that was causing the crash
  
  devise :database_authenticatable, :registerable,
         :validatable, :jwt_authenticatable, 
         jwt_revocation_strategy: self

  # Standard JTI logic (reproducing what the Devise module does)
  before_validation :generate_jti, on: :create
  validates :jti, presence: true, uniqueness: true

  # This method tells devise-jwt how to revoke a token
  def self.jwt_revocation_strategy
    self
  end

  private

  def generate_jti
    self.jti ||= SecureRandom.uuid
  end
end