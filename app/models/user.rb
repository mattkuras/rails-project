class User < ApplicationRecord
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

    def save_id_name 
        user.identities.each do |i|
            i.name = i.community.name 
        end
    end
end
