
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction),
    message: "%{value} is not a category" }
  validate :custom_validation


  def custom_validation
    if self.title
       unless self.title.include?("Won't Believe") || self.title.include?("Secret") || self.title.include?("Top [number]") || self.title.include?("Guess")
         errors.add(:title, "This must be click bait")
       end
    end
  end
end
