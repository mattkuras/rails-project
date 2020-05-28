User:
    has_many :posts 
    has_many :comments
    has_many :identities
    has_many :followers
    belongs_to :community



Post
    belongs_to :user
    has_many :comments
    
    t.string :content
    t.string :tag (tag is == to identities?)



Identity
    has_many :users
    has_one :community 
    



Followers
    belongs_to :user





Community
    has_many :members
    has_one :identity 
    has_many :posts 