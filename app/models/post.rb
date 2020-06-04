class Post < ApplicationRecord

  validates :content, presence: true

  has_many :comments
  belongs_to :community, optional: true
  belongs_to :user
  has_many :likes 
  
  scope :community_posts, -> {where(community_id: params[:community_id])}
  #Community.find_by(id: params[:community_id]).posts

  def last_updated 
    updated_at.strftime("From %A, %b %d")
  end
end

class Article < ApplicationRecord
  scope :published,               -> { where(published: true) }
  scope :published_and_commented, -> { published.where("comments_count > 0") }
end