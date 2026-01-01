class User < ApplicationRecord
  validates :first_name, :last_name, presence: true
  enum :gender, { male: "male", female: "female" }, default: :male
  validates :gender, presence: true
end