class Post < ApplicationRecord
  has_many :comments
  belongs_to :user
  has_many :likes 
  
  def last_updated 
    updated_at.strftime("From %A, %b %d")
  end
end