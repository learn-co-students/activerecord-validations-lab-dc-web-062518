require 'pry'
class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length:{maximum: 250}
  validates :category, inclusion:{in: %w(Fiction Non-Fiction), message: '%(value) is not valid'}
  validate :custom_validation

  def custom_validation
    arr = ["Won't Believe", "Secret", "Top [number]","Guess"]
    bool = false
    # binding.pry
    if !self.title.nil?
      # binding.pry
      arr.each do |spam|
        if self.title.include?(spam)
          bool = true
        end
      end
    end
    if bool == false
      errors.add(:title, "needs more clickbait!")
    end
  end
end
