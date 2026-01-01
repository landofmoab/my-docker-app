class UserPreferences < ApplicationRecord
  belongs_to :user

  enum :preferred_gender, { male: "male", female: " female" }, _prefix: true: true
end