class User < ApplicationRecord
  has_many :readings, primary_key: :email, foreign_key: :user_email
end
