require 'rails_helper'

RSpec.describe User, type: :model do
  subject { FactoryBot.build(:user, first_name: 'John', last_name: 'Doe') }

  describe "validations" do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should allow_value("test@example.com").for(:email) }
    it { should_not allow_value("invalid_email").for(:email) }
  end

  describe "associations" do
    it { should have_many(:books) }
  end

  describe "#name" do
    it "returns full name" do
      expect(subject.name).to eq("John Doe")
    end

    it "returns first name" do
      subject.last_name = nil
      expect(subject.name).to eq("John")
    end
  end
end
