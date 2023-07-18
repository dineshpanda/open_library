require 'rails_helper'

RSpec.describe Book, type: :model do
  describe "validations" do
    it { should validate_presence_of(:title) }
    it { should validate_uniqueness_of(:title).case_insensitive }
    it { should validate_presence_of(:author) }
    it { should validate_presence_of(:published_on) }
  end

  describe "associations" do
    it { should have_one(:user) }
  end
end
