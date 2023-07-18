# frozen_string_literal: true

class BookUser < ApplicationRecord
  validates :book_id, uniqueness: true

  belongs_to :book
  belongs_to :user
end
