
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 10 }
  validates :summary, length: {maximum: 40 }
  validates :category, inclusion: { in: %w(Fiction Non-fiction),  message: "Not a valid category" }
  validate :clickbait

  def clickbait
    if self.title
      unless self.title.include?("Won't Believe") || self.title.include?("Secret") || self.title.include?("Top [number]")|| self.title.include?("Guess")
        errors.add(:title, "Must be clickbait")
      end
    end
  end

end
