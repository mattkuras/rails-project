class User < ApplicationRecord
    # validates :first_name, presence: true, length: { minimum: 2 }
    # validates :first_name, presence: true, length: { minimum: 2 }
    # validates :password, length: { in: 6..20 }
    # validates :email, presence: true, uniqueness: true#, message: "that email has already been used"

    has_secure_password
    has_many :posts 
    has_many :comments
    has_many :identities

    has_many :communities, through: :identities 
    accepts_nested_attributes_for :identities, reject_if: proc { |attributes| attributes ['standard'].blank?}
    accepts_nested_attributes_for :communities

    has_many :likes, through: :posts 


    has_many :followers, class_name: "User", foreign_key: "followed_id"

    belongs_to :followed, class_name: "User", optional: true

    def name 
        self.first_name + " " + self.last_name
    end

    
end
