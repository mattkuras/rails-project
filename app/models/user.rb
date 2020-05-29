class User < ApplicationRecord
    has_secure_password

    has_many :posts 
    has_many :comments
    has_many :identities    
    belongs_to :community, optional: true

    has_many :followers, class_name: "User", foreign_key: "followed_id"

    belongs_to :followed, class_name: "User", optional: true

    def name 
        self.first_name + " " + self.last_name
    end
    
end
