# frozen_string_literal: true

class Book < ApplicationRecord
  validates :title, :author, :published_on, presence: true
end
