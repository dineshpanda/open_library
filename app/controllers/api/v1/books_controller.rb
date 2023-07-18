# frozen_string_literal: true

class Api::V1::BooksController < ApplicationController
  def index
    render json: Book.all.to_json(only: %i[id title author published_on])
  end

  def checkout
    book = Book.find_by(id: params[:book_id])
    current_user = User.find_by(id: params[:user_id])

    render(status: :not_found) && return unless book && current_user

    if book.user
      render(
        json: { message: "Book is unavailable, current reader name is #{book.user.name}" },
        status: :unprocessable_entity
      )
    else
      book.user = current_user
      book.save!
      render(json: { message: "You have checked out the book successfully" })
    end
  end
end
