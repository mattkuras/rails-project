class Post < ApplicationRecord

  validates :content, presence: true

  has_many :comments
  belongs_to :community, optional: true
  belongs_to :user
  has_many :likes 
  
  scope :reg_posts, -> {where(community_id: nil)}
  #Community.find_by(id: params[:community_id]).posts

  def last_updated 
    updated_at.strftime("From %A, %b %d")
  end
end

