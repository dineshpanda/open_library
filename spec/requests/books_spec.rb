require 'rails_helper'

RSpec.describe "Books", type: :request do
  let!(:book) { FactoryBot.create(:book) }
  let!(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:user) }

  describe "GET /index" do
    it "returns http success" do
      get api_v1_books_path
      expect(response).to have_http_status(:success)
      expect(response.parsed_body).to include(book.as_json(only: %i[id title author published_on]))
    end
  end

  describe "POST /checkout" do
    it "checkouts available book successfully" do
      post api_v1_book_checkout_path(book), params: { user_id: user.id }
      expect(response).to have_http_status(:success)
      expect(response.parsed_body["message"]).to eq("You have checked out the book successfully")
      expect(book.reload.user).to eq(user)
    end

    it "returns 404 if required params are missing" do
      post api_v1_book_checkout_path(book)
      expect(response).to have_http_status(:not_found)
    end

    it "returns 404 if invalid params are passed" do
      post api_v1_book_checkout_path(book), params: { user_id: 0 }
      expect(response).to have_http_status(:not_found)
    end

    it "fails to checkout when someone is currently using the book" do
      FactoryBot.create(:book_user, book:, user: other_user)
      post api_v1_book_checkout_path(book), params: { user_id: user.id }
      expect(response).to have_http_status(:unprocessable_entity)
      expect(response.parsed_body["message"]).to eq("Book is unavailable, current reader name is #{other_user.name}")
      expect(book.reload.user).to eq(other_user)
    end
  end
end
