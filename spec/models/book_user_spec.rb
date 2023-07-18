require 'rails_helper'

RSpec.describe BookUser, type: :model do
  let(:user) { FactoryBot.create(:user) }
  let(:other_user) { FactoryBot.create(:user) }
  let(:book) { FactoryBot.create(:book) }

  describe "validations" do
    it "validates book is assigned to one user" do
      FactoryBot.create(:book_user, user:, book:)
      book_user = FactoryBot.build(:book_user, book:, user: other_user)
      expect(book_user.valid?).to be false
    end
  end

  describe "associations" do
    it { should belong_to(:book) }
    it { should belong_to(:user) }
  end
end
