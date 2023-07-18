# frozen_string_literal: true

class User < ApplicationRecord
  EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i

  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }

  has_many :book_users
  has_many :books, through: :book_users

  def name
    [first_name, last_name].compact.join(" ")
  end
end
