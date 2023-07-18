## Cleanup
BookUser.destroy_all
Book.destroy_all
User.destroy_all

# Create books
100.times { FactoryBot.create(:book) }
users = 20.times.map { FactoryBot.create(:user) }

Book.limit(10).each do |b|
  b.user = users.sample
  b.save!
end
