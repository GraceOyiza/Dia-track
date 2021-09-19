class Reading < ApplicationRecord
  belongs_to :user, primary_key: :email, foreign_key: :user_email

  validates :fasting, :after_meal, :bp, :date, presence: true
end
