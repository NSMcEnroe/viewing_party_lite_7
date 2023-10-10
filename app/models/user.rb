# frozen_string_literal: true

# The User class contains all information for a user to utilize the application.

class User < ApplicationRecord
  has_many :user_viewing_parties
  has_many :viewing_parties, through: :user_viewing_parties

  validates :name, presence: true
  validates :email, presence: true
end
