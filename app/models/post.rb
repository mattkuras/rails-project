class Post < ApplicationRecord

  validates :content, presence: true

  has_many :comments
  belongs_to :community, optional: true
  belongs_to :user
  has_many :likes 
  
  def last_updated 
    updated_at.strftime("From %A, %b %d")
  end
end