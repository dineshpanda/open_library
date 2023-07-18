# frozen_string_literal: true

class Book < ApplicationRecord
  validates :author, :published_on, presence: true
  validates :title, presence: true, uniqueness: { case_sensitive: false }

  has_one :book_user
  has_one :user, through: :book_user
end
